import re

"""
Lucky number generation
"""

letters_to_int = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8, 'i': 9, 'j': 10, 'k': 11, 'l': 12,
                  'm': 13, 'n': 14, 'o': 15, 'p': 16, 'q': 17,
                  'r': 18, 's': 19, 't': 20, 'u': 21, 'v': 22, 'w': 23, 'x': 24, 'y': 25, 'z': 26}

'''
def validating_name(name):
    regex_name = re.compile(r'^([a-z]+)( [a-z]+)*( [a-z]+)*$', re.IGNORECASE)
    res = regex_name.search(name)
    if res:
        return True
    else:
        return False
'''


def remove(string):
    return string.replace(" ", "")


def luckynumbergeneration(name):
    name = name.lower()
    name = remove(name)
    name_list = []
    for char in name:
        name_list.append(char)
    # print(name_list)
    z = 0
    for i in name_list:
        z = z + letters_to_int[i]
    # print(z)
    luckynumber = int(z % 10)
    print("Your Lucky Number is ", luckynumber)


if __name__ == '__main__':
    print("Please enter your name:")
    name = input()
    #validating_name(name)
    luckynumbergeneration(name)


