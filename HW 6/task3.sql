-- 1
SELECT first_name
FROM restStaff
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE cust_name = "Tanya Singh";

-- 2 
SELECT room_date
FROM restRoom_management
INNER JOIN restStaff
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE room_name = "Green" AND first_name = "Charles" IN
  (SELECT room_date
  FROM restRoom_management
  WHERE room_date BETWEEN 160200 AND 160229);

-- 3
SELECT first_name, surname
FROM restStaff
WHERE headwaiter =
  (SELECT headwaiter
  FROM restStaff
  WHERE first_name = "Zoe" AND surname = "Ball");

-- 4
SELECT cust_name, bill_total, first_name
FROM restBill
INNER JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
ORDER BY bill_total DESC;

-- 5
SELECT first_name, surname
FROM restStaff
INNER JOIN restRoom_management
ON restStaff.staff_no = restRoom_management.headwaiter
WHERE staff_no = NULL AND staff_no =
   (SELECT staff_no
   FROM restSTaff
   INNER JOIN restBill 
   ON restStaff.staff_no = restBill.waiter_no
   WHERE bill_no = 00014 AND 00017);


-- 6
SELECT DISTINCT first_name, surname 
FROM restStaff
INNER JOIN restRoom_management
ON restStaff.headwaiter = restRoom_management.headwaiter
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE room_date = 160312 AND room_name = "Blue";