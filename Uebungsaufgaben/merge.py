import sys
from subprocess import call

BEGIN_DOCUMENT = "\\begin{document}"
END_DOCUMENT = "\\end{document}"
NEW_PAGE = "\\newpage"

def get_exercises():
    # get rid of the filename
    exercises_str = sys.argv[1:]
    return [int(exercise) for exercise in exercises_str]

def get_tex_filename(exercises):
    tex_filename = str(exercises[0])
    for i in range(1, len(exercises)):
        tex_filename += "-" + str(exercises[i])
    return tex_filename + ".tex"

def get_template_path():
    return "../Templates/print.tex"

def copy_template_header(template, fout):
    for line in template:
        idx = line.find(BEGIN_DOCUMENT)
        if idx < 0:
            fout.write(line)
        else:
            fout.write(line[:idx])
            break

def get_exercise_filename(exercise):
    return "A{:02d}.tex".format(exercise)

def copy_exercises(exercises, fout):
    for exercise in exercises:
        exercise_filename = get_exercise_filename(exercise)
        with open(exercise_filename, "r") as fin:
            doc_end = False
            for line in fin:
                idx_begin = line.find(BEGIN_DOCUMENT)
                idx_end = line.find(END_DOCUMENT)
                if idx_end >= 0:
                    if idx_end < idx_begin:
                        raise RuntimeError(exercise_filename + " is invalid!");
                    else:
                        doc_end = True
                if idx_begin >= 0:
                    if doc_end:
                        fout.write(line[(idx_begin + len(BEGIN_DOCUMENT)):idx_end])
                    else:
                        fout.write(line[idx_begin + len(BEGIN_DOCUMENT):])
                    break
            if not doc_end:
                for line in fin:
                    idx_end = line.find(END_DOCUMENT)
                    if idx_end < 0:
                        fout.write(line)
                    else:
                        fout.write(line[:idx_end])
                        break
            fout.write(NEW_PAGE)
            
if __name__ == "__main__":
    exercises = get_exercises()
    if len(exercises) == 0:
        raise RuntimeError("Please give exercise numbers as arguments!")
    tex_filename = get_tex_filename(exercises)
    with open(tex_filename, "w") as fout:
        with open(get_template_path(), "r") as template:
            copy_template_header(template, fout)
            fout.write(BEGIN_DOCUMENT)
            copy_exercises(exercises, fout)
            fout.write(END_DOCUMENT)
    call(["pdflatex", tex_filename])
