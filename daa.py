import sys
import mysql.connector

mydb = mysql.connector.connect(host="localhost", user="abhi", passwd="abhi", database="daa")
my_cursor = mydb.cursor()


def daa():
    f = 1
    while f != 3:
        print("Welcome to Health Assessment")
        print("********************")
        print("1. Record a question")
        print("2. Take the assessment")
        print("3. Exit")
        f = int(input("Enter your choice: "))
        if f == 1:
            question()
        elif f == 2:
            poll()
        elif f == 3:
            print("Exiting the Health Survey")
            my_cursor.close()
            mydb.close()
            sys.exit();
        else:
            daa()


def question():
    ch = 'Y'
    while ch == 'Y' or ch == 'y':
        print("Welcome to Question Portal")
        print("***********************")
        q = input("Enter the question :")
        op1 = input("Enter the option 1 :")
        score1 = input("Enter the score for question 1: ")
        op2 = input("Enter the option 2 :")
        score2 = input("Enter the score for question 2: ")
        op3 = input("Enter the option 3 :")
        score3 = input("Enter the score for question 3: ")
        op4 = input("Enter the option 4 :")
        score4 = input("Enter the score for question 4: ")
        my_cursor.execute("Select * from question")
        data = my_cursor.fetchall()
        qid = my_cursor.rowcount + 1
        my_cursor.execute("Insert into question (qid, q, op1, op2, op3, op4, sc1, sc2, sc3, sc4) values (%s,%s,%s,%s,"
                          "%s,%s,%s,%s,%s,%s)",
                          (qid, q, op1, op2, op3, op4, score1,
                           score2, score3, score4))
        mydb.commit()
        ch = input("Question added successfully.. Do you want to add more (Y/N)")
    daa()


def poll():
    print("Welcome to Assessment portal")
    print("***********************")
    my_cursor.execute("Select * from question")
    data = my_cursor.fetchall()
    name = input("Enter your name :")
    n = my_cursor.rowcount
    print("Assessment Started")
    response = []
    score = 0
    for i in range(0, n):
        ques = data[i][1]
        op1 = data[i][2]
        op2 = data[i][3]
        op3 = data[i][4]
        op4 = data[i][5]
        print("--------------------------------------------------------------------------------------------")
        print("Q.", i + 1, ": ", ques, "\nA.", op1, "\t\tB.", op2, "\nC.", op3, "\t\tD.", op4)
        print("--------------------------------------------------------------------------------------------")
        choice = input("Answer (A,B,C,D) :")
        if choice == 'A' or choice == 'a':
            score += data[i][6]
        elif choice == 'B' or choice == 'b':
            score += data[i][7]
        elif choice == 'C' or choice == 'c':
            score += data[i][8]
        elif choice == 'D' or choice == 'd':
            score += data[i][9]
        else:
            print("Kindly select A,B,C,D as option only")
        response.append(choice)
    response = str(response)
    my_cursor.execute("Select * from users")
    data = my_cursor.fetchall()
    uid = my_cursor.rowcount + 1
    my_cursor.execute("Insert into users (uid, name, response) values (%s,%s,%s)",
                      (uid, name, response))
    mydb.commit()
    print("Your responses are stored successfully")
    print("Assessment has finished !! Your final score is :", score)
    if score > 7:
        print("Your health is in excellent condition!")
    elif score > 0:
        print("Medical care is recommended")
    else:
        print("You need immediate medical attention")
    input("Press any key to continue")
    daa()


daa()
