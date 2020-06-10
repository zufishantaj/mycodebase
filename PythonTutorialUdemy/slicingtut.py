if __name__ == '__main__':
    letters = "abcdefghijklmnopqrstuvwxyz"
    slice1 = letters[25::-1]
    print(slice1)
    slice2 = letters[-10]+letters[-11]+letters[-12]
    print(slice2)
    print(letters[-10:-13:-1])
    print(letters[16:13:-1])
    print(letters[-22::-1])
    print(letters[4::-1])
    print(letters[25:17:-1])
    print(letters[:-9:-1])

    print(letters[-4:])
    print(letters[-1:])
    print(letters[:1])
    print(letters[0])