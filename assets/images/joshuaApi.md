1
# API TO CREATE DOCTOR

# Endpoint
http://127.0.0.1:8000/api/auth/Doctorregister

# Payload

{ 
    "name":"alfredkaziibwe123",
    "sex":"Male",
    "location":"Mbuya",
    "category":"head doctor",
    "nin":" GH234567876BJ",
    "age":"23",
    "email":"alfredkaziibwe19@gmail.com",
    "phone":"0785557587",
    "password":"123456"
}

# Output

{
  "doctor": {
    "name": "alfredkaziibwe123",
    "email": "alfredkaziibwe19@gmail.com",
    "sex": "Male",
    "location": "Mbuya",
    "category": "head doctor",
    "nin": "GH234567876BJ",
    "age": "23",
    "phone": "0785557587",
    "updated_at": "2024-06-20T21:30:59.000000Z",
    "created_at": "2024-06-20T21:30:59.000000Z",
    "id": 2
  },
  "status": true
}


2

# API TO LOGIN A DOCTOR

# Endpoint
http://127.0.0.1:8000/api/auth/Doctorlogin

# Payload
{
    "email":"alfredkaziibwe123@gmail.com",
    "password":"123456"
}

# Output

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvRG9jdG9ybG9naW4iLCJpYXQiOjE3MTg5MTk2NzUsImV4cCI6MTcxODkyMzI3NSwibmJmIjoxNzE4OTE5Njc1LCJqdGkiOiJvckdJUHdLNkpxUXZQdWx6Iiwic3ViIjoiMSIsInBydiI6ImUxNDc4N2FhYjY2Njg4Y2UwNmM0NzEyZTY3M2UxYTFjNDRmNDkwOTQifQ.UGv84m_ULWoYd-NtR2pYdrvJeupP6kjDcIy-bFA7jqA


3

# API TO SEE THE DOCTOR PROFILE

#Endpoint
http://127.0.0.1:8000/api/auth/profileDoctor

# Payload

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvRG9jdG9ybG9naW4iLCJpYXQiOjE3MTg5MTk2NzUsImV4cCI6MTcxODkyMzI3NSwibmJmIjoxNzE4OTE5Njc1LCJqdGkiOiJvckdJUHdLNkpxUXZQdWx6Iiwic3ViIjoiMSIsInBydiI6ImUxNDc4N2FhYjY2Njg4Y2UwNmM0NzEyZTY3M2UxYTFjNDRmNDkwOTQifQ.UGv84m_ULWoYd-NtR2pYdrvJeupP6kjDcIy-bFA7jqA

# Output

{
  "id": 1,
  "name": "alfredkaziibwe123",
  "sex": "Male",
  "phone": "0785557587",
  "location": "Mbuya",
  "category": "head doctor",
  "nin": "GH234567876BJ",
  "age": "23",
  "email": "alfredkaziibwe123@gmail.com",
  "email_verified_at": null,
  "created_at": "2024-06-20T21:30:19.000000Z",
  "updated_at": "2024-06-20T21:30:19.000000Z"
}

4

 # API TO CREATE A PATIENT

#  Endpoint
http://127.0.0.1:8000/api/auth/Patientregister

# Payload
{
    "name":"alfredkaziibwe123",
    "sex":"Male",
    "nin":" GH234567876BJ",
    "age":"23",
    "email":"alfredkaziibwe19@gmail.com",
    "phone":"0785557587",
    "password":"123456"
}

# Output

{
  "patient": {
    "name": "alfredkaziibwe123",
    "email": "alfredkaziibwe19@gmail.com",
    "sex": "Male",
    "nin": "GH234567876BJ",
    "age": "23",
    "phone": "0785557587",
    "updated_at": "2024-06-20T21:58:29.000000Z",
    "created_at": "2024-06-20T21:58:29.000000Z",
    "id": 1
  },
  "status": true
}

5

# API TO LOGIN PATIENT

# Endpoint
http://127.0.0.1:8000/api/auth/Patientlogin

# Payload
{
    "email":"alfredkaziibwe19@gmail.com",
    "password":"123456"
}
# Output

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvUGF0aWVudGxvZ2luIiwiaWF0IjoxNzE4OTIwOTczLCJleHAiOjE3MTg5MjQ1NzMsIm5iZiI6MTcxODkyMDk3MywianRpIjoid1I1cUcxM2FJWThFZVZBQyIsInN1YiI6IjEiLCJwcnYiOiI3NTI4OTU2NzEwZDFjNzViNjcxMzBkNGU0YzVjMGVlOWEwYWViNjE0In0.bFaU_oDsaU4cw14xv8HmjeYmmVfE0Uih1S0zqrzR8RE


6

# API TO GET THE PROFILE OF THE PATIENT

# Endpoint
http://127.0.0.1:8000/api/auth/profilePatient

# Payload

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvUGF0aWVudGxvZ2luIiwiaWF0IjoxNzE4OTIwOTczLCJleHAiOjE3MTg5MjQ1NzMsIm5iZiI6MTcxODkyMDk3MywianRpIjoid1I1cUcxM2FJWThFZVZBQyIsInN1YiI6IjEiLCJwcnYiOiI3NTI4OTU2NzEwZDFjNzViNjcxMzBkNGU0YzVjMGVlOWEwYWViNjE0In0.bFaU_oDsaU4cw14xv8HmjeYmmVfE0Uih1S0zqrzR8RE

# Output
{
  "id": 1,
  "name": "alfredkaziibwe123",
  "sex": "Male",
  "phone": "0785557587",
  "nin": "GH234567876BJ",
  "age": "23",
  "email": "alfredkaziibwe19@gmail.com",
  "email_verified_at": null,
  "created_at": "2024-06-20T21:58:29.000000Z",
  "updated_at": "2024-06-20T21:58:29.000000Z"
}

7

# API TO CREATE ADMIN

# Endpoint

# Payload
{
    "name":"alfredkaziibwe123",
    "email":"alfredkaziibwe19@gmail.com",
    "phone":"0785557587",
    "password":"123456"
}
# Output

{
  "admin": {
    "name": "alfredkaziibwe123",
    "email": "alfredkaziibwej19@gmail.com",
    "phone": "0785557587",
    "updated_at": "2024-06-20T22:17:44.000000Z",
    "created_at": "2024-06-20T22:17:44.000000Z",
    "id": 3
  },
  "status": true
}

8


# API TO LOGIN WITH ADMIN

# Endpoint
http://127.0.0.1:8000/api/auth/adminlogin

# Payload
{
    "email":"alfredkaziibwe19@gmail.com",
    "password":"123456"
}
# Output

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvYWRtaW5sb2dpbiIsImlhdCI6MTcxODkyMjY2NiwiZXhwIjoxNzE4OTI2MjY2LCJuYmYiOjE3MTg5MjI2NjYsImp0aSI6IkFua2tjMHdwa3l2YmdId3MiLCJzdWIiOiIxIiwicHJ2IjoiZGY4ODNkYjk3YmQwNWVmOGZmODUwODJkNjg2YzQ1ZTgzMmU1OTNhOSJ9.zEPY1V7HBifXLZZ6FYAGG8SYsCZNyoUpsfSpIahZSr4


9
# API TO VIEW THE PROFILE OF ADMIN

# Endpoint
http://127.0.0.1:8000/api/auth/profileAdmin

# Output

{
  "id": 1,
  "name": "alfredkaziibwe123",
  "email": "alfredkaziibwe19@gmail.com",
  "phone": "0785557587",
  "email_verified_at": null,
  "created_at": "2024-06-20T22:15:07.000000Z",
  "updated_at": "2024-06-20T22:15:07.000000Z"
}


10

# API TO CREATE BOOKING BY PATIENT

# Endpoint
http://127.0.0.1:8000/api/auth/createBooking

# Payload


{
    "patient_id":"1",
    "doctor_id":"1", 
    "session_date":"2024-06-20 21:30:19" 
    
}

# Output

{
  "booking": {
    "doctor_id": "1",
    "patient_id": "1",
    "session_date": "2024-06-20 21:30:19",
    "status": "pending",
    "updated_at": "2024-06-21T08:45:34.000000Z",
    "created_at": "2024-06-21T08:45:34.000000Z",
    "id": 1
  },
  "status": true
}


11
# API TO GET ALL BOOKINGS

# Endpoints
http://127.0.0.1:8000/api/auth/getAllBooking

# Output
{
  "Bookings": [
    {
      "id": 1,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2024-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:45:34.000000Z",
      "updated_at": "2024-06-21T08:45:34.000000Z"
    },
    {
      "id": 2,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2026-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:50:56.000000Z",
      "updated_at": "2024-06-21T08:50:56.000000Z"
    },
    {
      "id": 3,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2025-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:51:02.000000Z",
      "updated_at": "2024-06-21T08:51:02.000000Z"
    },
    {
      "id": 4,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2025-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:51:06.000000Z",
      "updated_at": "2024-06-21T08:51:06.000000Z"
    },
    {
      "id": 5,
      "patient_id": 2,
      "doctor_id": 1,
      "session_date": "2024-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:51:50.000000Z",
      "updated_at": "2024-06-21T08:51:50.000000Z"
    },
    {
      "id": 6,
      "patient_id": 2,
      "doctor_id": 1,
      "session_date": "2024-06-29 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T08:52:13.000000Z",
      "updated_at": "2024-06-21T08:52:13.000000Z"
    },
    {
      "id": 7,
      "patient_id": 2,
      "doctor_id": 1,
      "session_date": "2024-07-29 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T08:52:19.000000Z",
      "updated_at": "2024-06-21T08:52:19.000000Z"
    },
    {
      "id": 8,
      "patient_id": 2,
      "doctor_id": 1,
      "session_date": "2024-08-29 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T08:52:24.000000Z",
      "updated_at": "2024-06-21T08:52:24.000000Z"
    }
  ]
}

12


# API TO GET THE BOOKING BY THE DOCTOR

# Endpoint
http://127.0.0.1:8000/api/auth/getBookingByDoctor/2

# Output

{
  "doctor": {
    "id": 2,
    "name": "alfredkaziibwe123",
    "sex": "Male",
    "phone": "0785557587",
    "location": "Mbuya",
    "category": "head doctor",
    "nin": "GH234567876BJ",
    "age": "23",
    "email": "alfredkaziibwe19@gmail.com",
    "email_verified_at": null,
    "created_at": "2024-06-20T21:30:59.000000Z",
    "updated_at": "2024-06-20T21:30:59.000000Z"
  },
  "booking": [
    {
      "id": 9,
      "patient_id": 1,
      "doctor_id": 2,
      "session_date": "2024-08-29 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T09:26:48.000000Z",
      "updated_at": "2024-06-21T09:26:48.000000Z"
    },
    {
      "id": 10,
      "patient_id": 1,
      "doctor_id": 2,
      "session_date": "2024-08-01 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T09:26:59.000000Z",
      "updated_at": "2024-06-21T09:26:59.000000Z"
    },
    {
      "id": 11,
      "patient_id": 2,
      "doctor_id": 2,
      "session_date": "2024-08-05 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T09:28:11.000000Z",
      "updated_at": "2024-06-21T09:28:11.000000Z"
    },
    {
      "id": 12,
      "patient_id": 2,
      "doctor_id": 2,
      "session_date": "2024-08-07 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T09:28:18.000000Z",
      "updated_at": "2024-06-21T09:28:18.000000Z"
    },
    {
      "id": 13,
      "patient_id": 3,
      "doctor_id": 2,
      "session_date": "2024-08-07 21:30:29",
      "status": "confirmed",
      "created_at": "2024-06-21T09:28:37.000000Z",
      "updated_at": "2024-06-21T11:56:58.000000Z"
    }
  ]
}

13

# API TO GET BOOKING BY THE PATIENT

# Endpoint
http://127.0.0.1:8000/api/auth/getBookingByPatient/1

# Output
{
  "patient": {
    "id": 1,
    "name": "alfredkaziibwe123",
    "sex": "Male",
    "phone": "0785557587",
    "nin": "GH234567876BJ",
    "age": "23",
    "email": "alfredkaziibwe19@gmail.com",
    "email_verified_at": null,
    "created_at": "2024-06-20T21:58:29.000000Z",
    "updated_at": "2024-06-20T21:58:29.000000Z"
  },
  "booking": [
    {
      "id": 1,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2024-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:45:34.000000Z",
      "updated_at": "2024-06-21T08:45:34.000000Z"
    },
    {
      "id": 2,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2026-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:50:56.000000Z",
      "updated_at": "2024-06-21T08:50:56.000000Z"
    },
    {
      "id": 3,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2025-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:51:02.000000Z",
      "updated_at": "2024-06-21T08:51:02.000000Z"
    },
    {
      "id": 4,
      "patient_id": 1,
      "doctor_id": 1,
      "session_date": "2025-06-20 21:30:19",
      "status": "pending",
      "created_at": "2024-06-21T08:51:06.000000Z",
      "updated_at": "2024-06-21T08:51:06.000000Z"
    },
    {
      "id": 9,
      "patient_id": 1,
      "doctor_id": 2,
      "session_date": "2024-08-29 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T09:26:48.000000Z",
      "updated_at": "2024-06-21T09:26:48.000000Z"
    },
    {
      "id": 10,
      "patient_id": 1,
      "doctor_id": 2,
      "session_date": "2024-08-01 21:30:29",
      "status": "pending",
      "created_at": "2024-06-21T09:26:59.000000Z",
      "updated_at": "2024-06-21T09:26:59.000000Z"
    }
  ]
}

14

# API TO DELETE THE BOOKING
# Endpoint

http://127.0.0.1:8000/api/auth/deleteBooking/14

# Output
{
  "message": "booking  deleted successfully"
}


15

# API TO UPDATE THE BOOKING STATUS

# Endpoint
http://127.0.0.1:8000/api/auth/updateBookingStatus/13

# Payload

{
  "status":"confirmed"
}
 # Output
{
  "message": "booking updated successfully",
  "status": true
}


16

# API TO GET ALL  PATIENTS

# Endpoint
http://127.0.0.1:8000/api/auth/getAllPatients

# Output

{
  "patients": [
    {
      "id": 1,
      "name": "alfredkaziibwe123",
      "sex": "Male",
      "phone": "0785557587",
      "nin": "GH234567876BJ",
      "age": "23",
      "email": "alfredkaziibwe19@gmail.com",
      "email_verified_at": null,
      "created_at": "2024-06-20T21:58:29.000000Z",
      "updated_at": "2024-06-20T21:58:29.000000Z"
    },
    {
      "id": 2,
      "name": "alfredkaziibwe123",
      "sex": "Male",
      "phone": "0785557587",
      "nin": "GH234567876BJ",
      "age": "23",
      "email": "alfredkazijibwe19@gmail.com",
      "email_verified_at": null,
      "created_at": "2024-06-21T08:14:02.000000Z",
      "updated_at": "2024-06-21T08:14:02.000000Z"
    },
    {
      "id": 3,
      "name": "alfredkaziibwe123",
      "sex": "Male",
      "phone": "0785557587",
      "nin": "GH234567876BJ",
      "age": "23",
      "email": "alfredkjhazijibwe19@gmail.com",
      "email_verified_at": null,
      "created_at": "2024-06-21T08:14:10.000000Z",
      "updated_at": "2024-06-21T08:14:10.000000Z"
    }
  ]
}


17

# API TO CREATE ARTICLE

# Endpoint

http://127.0.0.1:8000/api/auth/createArticle

# Payload


{
  "doctor_id":3,
  "content":"we are venom"
}

# Output

{
  "arcticle": {
    "doctor_id": 3,
    "content": "we are venom",
    "createdAt": "2024-06-21 13:02:42",
    "id": 6
  },
  "status": true
}


18

# API TO GET ALL ARTICLE 

# Endpoint
http://127.0.0.1:8000/api/auth/getAllArticle

# Output
{
  "articles": [
    {
      "id": 1,
      "doctor_id": 1,
      "cover_image": null,
      "createdAt": "2024-06-20 23:15:28",
      "content": "God is the best that i have ever recieved in my life",
      "created_at": null,
      "updated_at": null
    },
    {
      "id": 2,
      "doctor_id": 1,
      "cover_image": null,
      "createdAt": "2024-06-20 23:16:49",
      "content": "Reacher than i have ever been",
      "created_at": null,
      "updated_at": null
    },
    {
      "id": 3,
      "doctor_id": 2,
      "cover_image": null,
      "createdAt": "2024-06-20 23:18:15",
      "content": "Am the best this is the what we have",
      "created_at": null,
      "updated_at": null
    },
    {
      "id": 4,
      "doctor_id": 2,
      "cover_image": null,
      "createdAt": "2024-06-20 23:18:34",
      "content": "i dont like it for sure",
      "created_at": null,
      "updated_at": null
    }
  ]
}

19



# API TO GET THE ARTICLE BY THE ID

# Endpoint
http://127.0.0.1:8000/api/auth/getSingleArticle/1

# Output
{
  "article": {
    "id": 1,
    "doctor_id": 1,
    "cover_image": null,
    "createdAt": "2024-06-20 23:15:28",
    "content": "God is the best that i have ever recieved in my life",
    "created_at": null,
    "updated_at": null
  }
}
  
  20


# API TO DELETE ARTICLE 
 # Endpoint
http://127.0.0.1:8000/api/auth/deleteArticle/5

# Output

{
  "message": "article deleted successfully"
}


21

# API TO GET ARTICLES BY THE DOCTOR ID

# Endpoint
http://127.0.0.1:8000/api/auth/getArticlesDoctor/1


# Output

{
  "doctor": {
    "id": 1,
    "name": "alfredkaziibwe123",
    "sex": "Male",
    "phone": "0785557587",
    "location": "Mbuya",
    "category": "head doctor",
    "nin": "GH234567876BJ",
    "age": "23",
    "email": "alfredkaziibwe123@gmail.com",
    "email_verified_at": null,
    "created_at": "2024-06-20T21:30:19.000000Z",
    "updated_at": "2024-06-20T21:30:19.000000Z"
  },
  "articles": [
    {
      "id": 1,
      "doctor_id": 1,
      "cover_image": null,
      "createdAt": "2024-06-20 23:15:28",
      "content": "God is the best that i have ever recieved in my life",
      "created_at": null,
      "updated_at": null
    },
    {
      "id": 2,
      "doctor_id": 1,
      "cover_image": null,
      "createdAt": "2024-06-20 23:16:49",
      "content": "Reacher than i have ever been",
      "created_at": null,
      "updated_at": null
    }
  ]
}

22


# API TO READ ALL DOCTORS

# Endpoint
http://127.0.0.1:8000/api/auth/getAllDoctors

# Output
{
  "doctors": [
    {
      "id": 1,
      "name": "alfredkaziibwe123",
      "sex": "Male",
      "phone": "0785557587",
      "location": "Mbuya",
      "category": "head doctor",
      "nin": "GH234567876BJ",
      "age": "23",
      "email": "alfredkaziibwe123@gmail.com",
      "email_verified_at": null,
      "created_at": "2024-06-20T21:30:19.000000Z",
      "updated_at": "2024-06-20T21:30:19.000000Z"
    },
    {
      "id": 2,
      "name": "alfredkaziibwe123",
      "sex": "Male",
      "phone": "0785557587",
      "location": "Mbuya",
      "category": "head doctor",
      "nin": "GH234567876BJ",
      "age": "23",
      "email": "alfredkaziibwe19@gmail.com",
      "email_verified_at": null,
      "created_at": "2024-06-20T21:30:59.000000Z",
      "updated_at": "2024-06-20T21:30:59.000000Z"
    },
    {
      "id": 3,
      "name": "alfredkaziibwe123",
      "sex": "Male",
      "phone": "0785557587",
      "location": "Mbuya",
      "category": "head doctor",
      "nin": "GH234567876BJ",
      "age": "23",
      "email": "alfredkaziihbwe1n9@gmail.com",
      "email_verified_at": null,
      "created_at": "2024-06-20T22:34:55.000000Z",
      "updated_at": "2024-06-20T22:34:55.000000Z"
    }
  ]
}


23


# API TO DELETE Doctor 

# Endpoint
http://127.0.0.1:8000/api/auth/deleteDoctor/4

# Output

[
  "Doctor deleted successfully"
]


24

# API TO CREAT GROUP BY DOCTOR

# Endpoint
http://127.0.0.1:8000/api/auth/createGroup

#  Output


{
  "doctor_id":2,
  "title":"cancerind not again ",
  "description":" this group is to push it away ",

  "link":"http://127.0.0.1:8000/api/auth/createGroup"
}


25

# API TO GET ALL THE GROUPS

# Endpoint
http://127.0.0.1:8000/api/auth/getAllGroups

#  Ouput
{
  "groups": [
    {
      "id": 1,
      "doctor_id": 1,
      "link": "http://127.0.0.1:8000/api/auth/createGroup",
      "title": "cancer healed",
      "description": "this group is to heal cancer",
      "cover_image_url": null,
      "created_at": "2024-06-21T10:27:43.000000Z",
      "updated_at": "2024-06-21T10:27:43.000000Z"
    },
    {
      "id": 2,
      "doctor_id": 1,
      "link": "http://127.0.0.1:8000/api/auth/createGroup",
      "title": "cancer fall",
      "description": "this group is to heal cancer",
      "cover_image_url": null,
      "created_at": "2024-06-21T11:07:33.000000Z",
      "updated_at": "2024-06-21T11:07:33.000000Z"
    },
    {
      "id": 3,
      "doctor_id": 2,
      "link": "http://127.0.0.1:8000/api/auth/createGroup",
      "title": "cancer down",
      "description": "this group is to down cancer",
      "cover_image_url": null,
      "created_at": "2024-06-21T11:07:57.000000Z",
      "updated_at": "2024-06-21T11:07:57.000000Z"
    },
    {
      "id": 4,
      "doctor_id": 2,
      "link": "http://127.0.0.1:8000/api/auth/createGroup",
      "title": "cancer not again",
      "description": "this group is to push it away",
      "cover_image_url": null,
      "created_at": "2024-06-21T11:08:44.000000Z",
      "updated_at": "2024-06-21T11:08:44.000000Z"
    }
  ]
}


26


# API TO GET GROUP DOCTORS

# Endpoint
http://127.0.0.1:8000/api/auth/getGroupByDoctor/1

 # Output
{
  "doctor": {
    "id": 1,
    "name": "alfredkaziibwe123",
    "sex": "Male",
    "phone": "0785557587",
    "location": "Mbuya",
    "category": "head doctor",
    "nin": "GH234567876BJ",
    "age": "23",
    "email": "alfredkaziibwe123@gmail.com",
    "email_verified_at": null,
    "created_at": "2024-06-20T21:30:19.000000Z",
    "updated_at": "2024-06-20T21:30:19.000000Z"
  },
  "group": [
    {
      "id": 1,
      "doctor_id": 1,
      "link": "http://127.0.0.1:8000/api/auth/createGroup",
      "title": "cancer healed",
      "description": "this group is to heal cancer",
      "cover_image_url": null,
      "created_at": "2024-06-21T10:27:43.000000Z",
      "updated_at": "2024-06-21T10:27:43.000000Z"
    },
    {
      "id": 2,
      "doctor_id": 1,
      "link": "http://127.0.0.1:8000/api/auth/createGroup",
      "title": "cancer fall",
      "description": "this group is to heal cancer",
      "cover_image_url": null,
      "created_at": "2024-06-21T11:07:33.000000Z",
      "updated_at": "2024-06-21T11:07:33.000000Z"
    }
  ]
}


27

#  API TO GET SINGLE GROUP

# Endpoint 
http://127.0.0.1:8000/api/auth/getSingleGroup/2

# Output
{
  "group": {
    "id": 2,
    "doctor_id": 1,
    "link": "http://127.0.0.1:8000/api/auth/createGroup",
    "title": "cancer fall",
    "description": "this group is to heal cancer",
    "cover_image_url": null,
    "created_at": "2024-06-21T11:07:33.000000Z",
    "updated_at": "2024-06-21T11:07:33.000000Z"
  }
}


28


# API TO DELETE  GROUP

# Endpoint
http://127.0.0.1:8000/api/auth/deleteGroup/2

# Output

[
  "Booking deleted successfully"
]


