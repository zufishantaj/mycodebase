if __name__ == '__main__':
    age = 24
    print("My age is " + str(age) + " years.")
    print("My age is {0} years.".format(24))
    print("My age is {0} years.".format(age))

    print("There are {0} days in {1}, {2}, {3}, {4}, {5}, {6} and {7}.".format(31, "Jan", "Mar", "May", "Jul", "Aug",
                                                                               "Oct", "Dec"))

    print(
        "Jan: {2}, Feb: {0}, Mar: {2}, Apr: {1}, May: {2}, Jun: {1}, Jul: {2}, Aug: {2}, Sep: {1}, Oct: {2}, Nov: {1}, Dec: {2}.".format(
            28, 30, 31))
