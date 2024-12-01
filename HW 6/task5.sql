-- 1
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 2
ORDER BY bill_count DESC;

-- 2
SELECT room_name, COUNT(*) AS large_tables_count
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name
ORDER BY large_tables_count DESC;

-- 3
SELECT t.room_name, ROUND(SUM(b.bill_total), 2) AS total_room_bills
FROM restRest_table t
JOIN restBill b ON t.table_no = b.table_no
GROUP BY t.room_name
ORDER BY total_room_bills DESC;

-- 4
SELECT h.first_name, h.surname, ROUND(SUM(b.bill_total), 2) AS total_bills
FROM restStaff h
JOIN restStaff w ON h.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY h.staff_no, h.first_name, h.surname
ORDER BY total_bills DESC;

-- 5
SELECT cust_name, ROUND(AVG(bill_total), 2) AS average_bill
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400
ORDER BY average_bill DESC;

-- 6
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 3
ORDER BY bill_count DESC;