import matplotlib.pyplot as plt
import pymysql
from pymysql.cursors import DictCursor


def connect_to_database(username, password):
   try:
       connection = pymysql.connect(
           host = 'localhost',
           user = username,
           password = password,
           database = 'scholarship',
           charset = 'utf8mb4',
           cursorclass = pymysql.cursors.DictCursor
       )
       return connection
   except pymysql.err.OperationalError as oe:
       print('Error: %d %s' % (oe.args[0], oe.args[1]))
       print("Invalid credentials or connection issue. Please try again.")
       return None
   except Exception as e:
       print("An unexpected error occurred:", e)
       return None


def display_menu():
   print("\nMenu:\n")
   print("1: Add member")
   print("2: Update member information")
   print("3: Delete member")
   print("\n4: Add completed course")
   print("5: Search for members by course")
   print("6: Search for courses by member")
   print("\n7: Display members by college")
   print("8: Display members by major")
   print("9: Display members by minor")
   print("\n10: Declare major")
   print("11: Drop major")
   print("\n12: Declare minor")
   print("13: Drop minor")
   print("\n14: Search for credit total by member")
   print("15: Display all member credit totals")
   print("\n16: Disconnect from the database and close the application")


def add_member(connection):
   try:
       member_id = input("\nEnter the member's ID: ")
       member_name = input("Enter the member's full name: ")
       phone_number = input("Enter the member's phone number: ")
       email = input("Enter the member's email: ")
       admission_year = input("Enter the member's year of admission: ")
       expected_grad = input("Enter the member's expected year of graduation: ")
       cur = connection.cursor()
       cur.callproc("add_member", [member_id, member_name, phone_number, email, admission_year, expected_grad])
       print("Member added successfully.")
       print("\nPress enter to continue...")
       input()
   except pymysql.MySQLError as e:
       print(f"Error occurred: {e}. Please review the details and try again.")
       print("\nPress enter to continue...")
       input()
   connection.commit()
   cur.close()


def update_member(connection):
   try:
       member_id = input("\nEnter the member's ID: ")
       member_name = input("Enter the member's full name: ")
       phone_number = input("Enter the member's phone number: ")
       email = input("Enter the member's email: ")
       admission_year = input("Enter the member's year of admission: ")
       expected_grad = input("Enter the member's expected year of graduation: ")
       cur = connection.cursor()
       cur.callproc("update_member", [member_id, member_name, phone_number, email, admission_year, expected_grad])
       print("Member updated successfully.")
       print("\nPress enter to continue...")
       input()
   except pymysql.MySQLError as e:
       print(f"Error occurred: {e}. Please review the details and try again.")
       print("\nPress enter to continue...")
       input()
   connection.commit()
   cur.close()


def remove_member(connection):
   try:
       member_id = input("\nEnter the member's ID: ")
       cur = connection.cursor()
       cur.callproc("remove_member", [member_id])
       print("Member deleted successfully.")
       print("\nPress enter to continue...")
       input()
   except pymysql.MySQLError as e:
       print(f"Error occurred: {e}. Please review the details and try again.")
       print("\nPress enter to continue...")
       input()
   connection.commit()
   cur.close()


def add_course(connection):
   try:
       member_id = input("\nEnter the member's ID: ")
       course_abbrev = input("Enter the course abbreviation: ")
       course_name = input("Enter the course name: ")
       credit_hours = input("Enter the associated number of credit hours: ")
       professor_name = input("Enter the professor's full name: ")
       sem_type = input("Enter the semester type (Fall, Spring, Summer 1, or Summer 2): ")
       sem_year = input("Enter the year: ")
       cur = connection.cursor()
       cur.callproc("add_course", [course_abbrev, course_name, credit_hours, member_id, professor_name, sem_type, sem_year])
       print("Course added successfully.")
       print("\nPress enter to continue...")
       input()
   except pymysql.MySQLError as e:
       print(f"Error occurred: {e}. Please review the details and try again.")
       print("\nPress enter to continue...")
       input()
   connection.commit()
   cur.close()


def who_has_taken(connection):
   try:
       course_abbrev = input("\nEnter the course abbreviation: ")
       cur = connection.cursor()
       cur.callproc("who_has_taken", [course_abbrev])
       rows = cur.fetchall()
       print(f"\n{'ID':<5} "
             f"{'Member Name':<20} "
             f"{'Member Year':<15} "
             f"{'Phone Number':<15} "
             f"{'Email':<30} "
             f"{'Term Type':<15} "
             f"{'Year Taken':<15} "
             f"{'Professor':<15}")
       for row in rows:
           print(f"{row['member_id']:<5} "
                 f"{row['member_name']:<20} "
                 f"{row['current_year']:<15} "
                 f"{row['phone_number']:<15} "
                 f"{row['email']:<30} "
                 f"{row['semester_type']:<15} "
                 f"{row['semester_year']:<15} "
                 f"{row['professor_name']:<15}")
       print("\nPress enter to continue...")
       input()
   except pymysql.MySQLError as e:
       print(f"Error occurred: {e}. Please review the details and try again.")
       print("\nPress enter to continue...")
       input()
   connection.commit()
   cur.close()

def get_courses(connection):
   try:
       member_id = input("\nEnter the member's ID: ")
       cur = connection.cursor()
       cur.callproc("get_courses", [member_id])
       rows = cur.fetchall()
       print(f"\n{'Course Code':<15} "
             f"{'Course Name':<60} "
             f"{'Credit Hours':<15} "
             f"{'Term Type':<15} "
             f"{'Year Taken':<15} "
             f"{'Professor':<15} ")
       for row in rows:
           print(f"{row['course_abbrev']:<15} "
                 f"{row['course_name']:<60} "
                 f"{row['credit_hours']:<15} "
                 f"{row['semester_type']:<15} "
                 f"{row['semester_year']:<15} "
                 f"{row['professor_name']:<15} ")
       print("\nPress enter to continue...")
       input()
   except pymysql.MySQLError as e:
       print(f"Error occurred: {e}. Please review the details and try again.")
       print("\nPress enter to continue...")
       input()
   connection.commit()
   cur.close()

def by_college(connection):
   try:
       cur = connection.cursor()
       cur.callproc("by_college")
       rows = cur.fetchall()
       print(f"\n{'College Name':<50} "
             f"{'Number of Members':<20}" )
       for row in rows:
           print(f"{row['college_name']:<50} "
                 f"{row['num_members']:<20} ")
       categories = [entry['college_name'] for entry in rows]
       values = [entry['num_members'] for entry in rows]
       plt.bar(categories, values)
       plt.title("Members by College")
       plt.ylabel("Number of Members")
       plt.show()
       print("\nPress enter to continue...")
       input()
   except pymysql.MySQLError as e:
       print(f"Error occurred: {e}. Please review the details and try again.")
       print("\nPress enter to continue...")
       input()
   connection.commit()
   cur.close()

def by_major(connection):
    try:
        cur = connection.cursor()
        cur.callproc("by_major")
        rows = cur.fetchall()
        print(f"\n{'Major':<50} "
            f"{'Number of Members':<20}")
        for row in rows:
            print(f"{row['major_name']:<50} "
                f"{row['num_members']:<20} ")
        categories = [entry['major_name'] for entry in rows]
        values = [entry['num_members'] for entry in rows]
        plt.bar(categories, values)
        plt.title("Members by Major")
        plt.ylabel("Number of Members")
        plt.show()
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def by_minor(connection):
    try:
        cur = connection.cursor()
        cur.callproc("by_minor")
        rows = cur.fetchall()
        print(f"\n{'Minor':<50} "
            f"{'Number of Members':<20}")
        for row in rows:
            print(f"{row['minor_name']:<50} "
                f"{row['num_members']:<20} ")
        categories = [entry['minor_name'] for entry in rows]
        values = [entry['num_members'] for entry in rows]
        plt.bar(categories, values)
        plt.title("Members by Minor")
        plt.ylabel("Number of Members")
        plt.show()
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def add_major(connection):
    try:
        cur = connection.cursor()
        cur.callproc("majors")
        rows = cur.fetchall()
        print(f"\n{'Major ID':<50} "
                f"{'Major Name':<50}"
                f"{'College Name':<50}")
        for row in rows:
            print(f"{row['major_id']:<50} "
                    f"{row['major_name']:<50} "
                    f"{row['college_name']:<50} ")
        major_id = input("\nEnter desired major ID: ")
        member_id = input("Enter member ID: ")
        cur.callproc("associate_major", [member_id, major_id])
        print("Major added successfully.")
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def remove_major(connection):
    try:
        cur = connection.cursor()
        cur.callproc("majors")
        rows = cur.fetchall()
        print(f"\n{'Major ID':<50} "
              f"{'Major Name':<50}"
              f"{'College Name':<50}")
        for row in rows:
            print(f"{row['major_id']:<50} "
                  f"{row['major_name']:<50} "
                  f"{row['college_name']:<50} ")
        major_id = input("\nEnter desired major ID: ")
        member_id = input("Enter member ID: ")
        cur.callproc("disassociate_major", [member_id, major_id])
        print("Major removed successfully.")
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def add_minor(connection):
    try:
        cur = connection.cursor()
        cur.callproc("minors")
        rows = cur.fetchall()
        print(f"\n{'Minor ID':<50} "
                f"{'Minor Name':<50}"
                f"{'College Name':<50}")
        for row in rows:
            print(f"{row['minor_id']:<50} "
                    f"{row['minor_name']:<50} "
                    f"{row['college_name']:<50} ")
        minor_id = input("\nEnter desired minor ID: ")
        member_id = input("Enter member ID: ")
        cur.callproc("associate_minor", [member_id, minor_id])
        print("Minor added successfully.")
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def remove_minor(connection):
    try:
        cur = connection.cursor()
        cur.callproc("minors")
        rows = cur.fetchall()
        print(f"\n{'Minor ID':<50} "
              f"{'Minor Name':<50}"
              f"{'College Name':<50}")
        for row in rows:
            print(f"{row['minor_id']:<50} "
                  f"{row['minor_name']:<50} "
                  f"{row['college_name']:<50} ")
        minor_id = input("\nEnter desired minor ID: ")
        member_id = input("Enter member ID: ")
        cur.callproc("disassociate_minor", [member_id, minor_id])
        print("Minor removed successfully.")
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def count_member_credits(connection):
    try:
        member_id = input("Enter member ID: ")
        cur = connection.cursor()
        cur.execute("SELECT count_member_credits(%s) AS credits", (member_id))
        result = cur.fetchone()
        print("\nCredit Hours Accumulated")
        print(result['credits'])
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def count_credits(connection):
    try:
        cur = connection.cursor()
        cur.callproc("count_credits")
        rows = cur.fetchall()
        print(f"\n{'Member ID':<15} "
              f"{'Member Name':<30} "
              f"{'Credit Hour Total':<30} ")
        for row in rows:
            print(f"{row['member_id']:<15} "
                  f"{row['member_name']:<30} "
                  f"{row['credit_total']:<30} ")
        categories = [entry['member_name'] for entry in rows]
        values = [entry['credit_total'] for entry in rows]
        plt.bar(categories, values)
        plt.title("Credits by Member")
        plt.ylabel("Number of Credits")
        plt.show()
        print("\nPress enter to continue...")
        input()
    except pymysql.MySQLError as e:
        print(f"Error occurred: {e}. Please review the details and try again.")
        print("\nPress enter to continue...")
        input()
    connection.commit()
    cur.close()

def main():
   print("Starting program...")
   while True:
       username = input("\nEnter MySQL username: ")
       password = input("Enter MySQL password: ")

       connection = connect_to_database(username, password)

       if connection:
           print("Connection established.")
           break

   while True:
       display_menu()
       menu_selection = input("\nEnter your choice (1-16): ")

       if menu_selection == '1':
           add_member(connection)

       elif menu_selection == '2':
           update_member(connection)

       elif menu_selection == '3':
           remove_member(connection)

       elif menu_selection == '4':
           add_course(connection)

       elif menu_selection == '5':
           who_has_taken(connection);

       elif menu_selection == '6':
           get_courses(connection);

       elif menu_selection == '7':
           by_college(connection);

       elif menu_selection == '8':
           by_major(connection);

       elif menu_selection == '9':
           by_minor(connection);

       elif menu_selection == '10':
           add_major(connection);

       elif menu_selection == '11':
           remove_major(connection);

       elif menu_selection == '12':
           add_minor(connection);

       elif menu_selection == '13':
           remove_minor(connection);

       elif menu_selection == '14':
           count_member_credits(connection);

       elif menu_selection == '15':
           count_credits(connection);

       elif menu_selection == '16':
           print("\nDisconnecting and closing the application...")
           connection.close()
           break

       else:
           print("\nInvalid choice. Please select 1-16.")

main()