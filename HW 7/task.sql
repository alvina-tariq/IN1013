-- 1
CREATE VIEW samsBills
AS (SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
WHERE waiter_no = 004);

SELECT * FROM samsBills;

-- 2 
SELECT * FROM samsBills
WHERE samsBills.bill_total > 400.00;

-- 3
CREATE VIEW roomTotals
AS (SELECT room_name, SUM(bill_total) AS 'total_sum'
FROM restRest_table
INNER JOIN restBill
ON restRest_table.table_no = restBill.table_no
GROUP BY room_name);

SELECT * FROM roomTotals;

-- 4
CREATE VIEW teamTotals
AS (SELECT CONCAT(headwaiterStaff.first_name, ' ', headwaiterStaff.surname) AS 'headwaiter_name', SUM(bill_total) AS 'total_sum'
FROM restStaff
LEFT JOIN restStaff AS headwaiterStaff
ON restStaff.headwaiter = headwaiterStaff.staff_no
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
GROUP BY headwaiterStaff.staff_no);

SELECT * FROM teamTotals;