'''
You need to compute the grade of a student according to the marks it specifies out of 100.
If an error marks is given by the user print an error.
Grade scheme:
>80 ->A
>=60 ->B
>=40 ->C
<40 ->D
'''

print("Enter the name of a student:")
name=input()
print("Enter marks obtained by ", name)
marks=int(input())
if marks<0 or marks>100:
   print("Marks cannot be negative or greater than 100")
else:
     if marks>80 and marks<=100:
         print(name , "has got Grade A.")
     else:
         if marks>=60 and marks<=80:
            print(name , "has got Grade B.")
         else:
            if marks>=40 and marks<60:
               print(name , "has got Grade C.")
            else:
               print(name , "has got Grade D.")
