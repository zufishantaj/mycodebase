if __name__ == '__main__':
    print("No formatting")
    for i in range(1, 13):
        print("No. {0} squared is {1} and cubed is {2}.".format(i, i ** 2, i ** 3))
    print()
    print("Right aligned")
    for j in range(1, 13):
        print("No. {0:2} squared is {1:4} and cubed is {2:4}.".format(j, j ** 2, j ** 3))
    print()
    print("Left aligned")
    for k in range(1, 13):
        print("No. {0:2} squared is {1:<3} and cubed is {2:<4}.".format(k, k ** 2, k ** 3))
    print()
    print("Center aligned")
    for k in range(1, 13):
        print("No. {0:2} squared is {1:^3} and cubed is {2:^4}.".format(k, k ** 2, k ** 3))