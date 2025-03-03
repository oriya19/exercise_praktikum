def get_fibo():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

gen = get_fibo()

def rev_str(my_str):
    for s in range(len(my_str) - 1, -1, -1):
        yield my_str[s]
