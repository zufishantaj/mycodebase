"""
To check the number entered by user is present in sample list
"""

def no_exist_in_sample(x):
    samplelist = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    if x in samplelist:
        print("The number", x, " is present in the sample list")
    else:
        print("The number", x, " is not present in the sample list")


if __name__ == '__main__':
    print("Please enter a number:")
    x = int(input())
    no_exist_in_sample(x)
