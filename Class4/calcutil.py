def add(x, y):
    z = x + y
    return z


def subtract(x, y):
    z = x - y
    return z


def multiply(x, y):
    z = x * y
    return z


def division(x, y):
    z = x / y
    return z


def expo(x, y):
    z = x ** y
    return z


def mod(x, y):
    z = x % y
    return z


def avg(x, y):
    z = x + y / 2
    return z
if __name__=="__main__":
    print("Please enter the 1st number: ")
    x = int(input())
    print("Please enter the 2nd number: ")
    y = int(input())

    print("Addition :", add(x, y))
    print("subtract :", subtract(x, y))
    print("multiply :", multiply(x, y))
    print("division :", division(x, y))
    print("mod :", mod(x, y))
    print("avg :", avg(x, y))

