import numpy as np


def matrix2tex(matrix, decimals=2):
    tex = "\\begin{bmatrix}\n"
    if len(matrix.shape) == 1:
        matrix = matrix.reshape((1, len(matrix)))
    for row in matrix:
        for col in row:
            tex += str(round(col, decimals)) + " & "
        tex += "\\\\\n"
    tex += "\\end{bmatrix}"
    return tex