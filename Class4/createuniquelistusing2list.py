'''
Program to create a list containing only unique elements from two different lists
'''

list1 = []
list2 = []
list3 = []


def inserting_elements_in_list():
    for i in range(3):
        print("Please insert elements in list 1:")
        x = int(input())
        list1.append(x)
    for j in range(3):
        print("Please insert elements in list 2:")
        y = int(input())
        list2.append(y)


def creating_unique_list(list1, list2):
    for i in list1:
        if i not in list3:
            list3.append(i)
    for j in list2:
        if j not in list3:
            list3.append(j)
    print(list3)



if __name__ == '__main__':
    inserting_elements_in_list()
    creating_unique_list(list1, list2)
