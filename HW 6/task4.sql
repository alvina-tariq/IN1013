-- 1
SELECT DISTINCT cust_name
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
WHERE h.first_name = 'Charles' AND b.bill_total > 450.00;

-- 2
SELECT DISTINCT h.first_name, h.surname
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
JOIN restRoom_management rm ON h.staff_no = rm.headwaiter 
                             AND rm.room_name = (
                                 SELECT room_name 
                                 FROM restRest_table 
                                 WHERE table_no = b.table_no
                             )
WHERE b.bill_date = 160111 
  AND b.cust_name = 'Nerida Smith';
  
-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = 
   (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT DISTINCT first_name, surname
FROM restStaff
LEFT JOIN restBill
ON restBill.waiter_no = restStaff.staff_no
WHERE waiter_no IS NULL;

-- 5
SELECT b.cust_name, 
       h.first_name AS headwaiter_first_name, 
       h.surname AS headwaiter_surname, 
       t.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
WHERE b.bill_total = 
   (SELECT MAX(bill_total) FROM restBill);