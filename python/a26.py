from sig import Signal
import numpy as np

def sum_k(table, template, K):
    res = np.zeros(K)
    for k in range(K):
        entries = template[k]
        for entry in entries:
            col = entry[0]
            row = entry[1]
            res[k] += table[col][row]
    return res

if __name__ == "__main__":
    sig = Signal()
    sig.load_from_file("data/a26.txt")

    K = 10

    col0 = np.array(sig.measurements)
    table = np.concatenate((
        [col0],
        [np.round(col0 * 0.95)],
        [np.round(col0 * 0.81)],
        [np.round(col0 * 0.59)],
        [np.round(col0 * 0.30)]
    ))

    ak = np.zeros(K)
    bk = np.zeros(K)

    a_red_templates = [
        [(0,0), (1,1), (2,2), (3,3), (4,4), (1,19), (2, 18), (3, 17), (4, 16)],
        [(0,0), (2,1), (4,2), (4,8), (2,9), (0,10), (2,11), (4,12), (4,18), (2, 19)],
        [(0,0), (3,1), (2,6), (1,7), (4,8), (4,12), (1,13), (2,14), (3,19)],
        [(0,0), (0,5), (0,10), (0,15), (4,1), (4,4), (4,6), (4,9), (4,11), (4,14), (4,16), (4,19)],
        [(0,0), (0,4), (0,8), (0,12), (0,16)],
        [(0,0), (2,3), (4,4), (4,6), (2,7), (0,10), (2,13), (4,14), (4, 16), (2, 17)],
        [(0,0), (1,3), (2,6), (4,8), (3,9), (3,11), (4,12), (1,14), (0,17)],
        [(0,0), (0,5), (0,10), (0,15), (4,2), (4,3), (4,7), (4,8), (4,12), (4,13), (4,17), (4,18)],
        [(0,0), (2,2), (4,4), (3,7), (1,9), (1,11), (3,13), (4,16), (2,18)],
        [(0,0), (0,2), (0,4), (0,6), (0,8), (0,10), (0,12), (0,14), (0,16), (0,18)]
    ]

    a_blue_templates = [
        [(4,6), (3,7), (2,8), (1,9), (0,10), (1,11), (2,12), (3,13), (4,14)],
        [(4,3), (2,4), (0,5), (2,6), (4,7), (4,13), (2,14), (0,15), (2,16), (4,17)],
        [(4,2), (1,3), (2,4), (3,9), (0,10), (3,11), (2,16), (1,17), (4,18)],
        [(2,2), (2,3), (2,7), (2,8), (2,12), (2,13), (2,17), (2,18)],
        [(0,2), (0,6), (0,10), (0,14), (0,18)],
        [(4,1), (2,2), (0,5), (2,8), (4,9), (4,11), (2,12), (0,15), (2,18), (4,19)],
        [(3,1), (4,2), (2,4), (1,7), (0,10), (0,13), (1,16), (4,18), (3,19)],
        [(2,1), (2,4), (2,6), (2,9), (2,11), (2,14), (2,16), (2,19)],
        [(1,1), (3,3), (4,6), (2,8), (0,10), (2,12), (4,14), (3,17), (1,19)],
        [(0,1), (0,3), (0,5), (0,7), (0,9), (0,11), (0,13), (0,15), (0,17)]
    ]

    b_red_templates = [
        [(4,1), (3,2), (2,3), (1,4), (0,5), (1,6), (2,7), (3,8), (4,9)],
        [(3,1), (1,2), (1,3), (3,4), (3,11), (1,12), (1,13), (3,14)],
        [(2,1), (1,2), (4,3), (4,7), (1,8), (2,9), (3,14), (0,15), (3,16)],
        [(1,1), (1,6), (1,11), (1,16), (3,2), (3,7), (3,12), (3,17)],
        [(0,1), (0,5), (0,9), (0,13), (0,17)],
        [(0,1), (0,4), (0,11), (0,14), (2,7), (2,8), (2,17), (2,18)],
        [(1,1), (4,3), (3,4), (3,6), (4,7), (2,9), (1,12), (0,15), (1,18)],
        [(3,1), (1,3), (3,6), (1,8), (3,11), (1,13), (3,16), (1,18)],
        [(4,1), (2,3), (0,5), (2,7), (4,9), (3,12), (1,14), (1,16), (3,18)],
        []
    ]

    b_blue_templates = [
        [(4,11), (3,12), (2,13), (1,14), (0,15), (1,16), (2,17), (3,18), (4,19)],
        [(3,6), (1,7), (1,8), (3,9), (3,16), (1,17), (1,18), (3,19)],
        [(3,4), (0,5), (3,6), (2,11), (1,12), (4,13), (4,17), (1,18), (2,19)],
        [(3,3), (1,4), (3,8), (1,9), (3,13), (1,14), (3,18), (1,19)],
        [(0,3), (0,7), (0,11), (0,15), (0,19)],
        [(0,6), (0,9), (0,16), (0,19), (3,3), (3,4), (3,12), (3,13)],
        [(0,2), (0,5), (1,8), (2,11), (3,14), (4,13), (3,16), (4,17), (2,19)],
        [(1,2), (3,4), (1,7), (3,9), (1,12), (3,14), (1,17), (3,19)],
        [(3,2), (1,4), (1,6), (3,8), (4,11), (2,13), (0,15), (2,17), (4,19)],
        []
    ]

    ak_sum_red = sum_k(table, a_red_templates, K)
    ak_sum_blue = sum_k(table, a_blue_templates, K)
    bk_sum_red = sum_k(table, b_red_templates, K)
    bk_sum_blue = sum_k(table, b_blue_templates, K)

    ak = (ak_sum_red - ak_sum_blue) / K
    bk = (bk_sum_red - bk_sum_blue) / K

    ak = np.insert(ak, 0, np.average(table[0]))
    bk = np.insert(bk, 0, 0)
    
    print("ak:")
    print(ak)
    print("bk:")
    print(bk)