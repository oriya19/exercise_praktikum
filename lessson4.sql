--=================טריגרים=מזניקים============
--קישור של קטע קוד בעת ארוע על הטבלה
--ארוע פקודת DML
--טריגר משוייך לטבלה ורק אחת
--ומופעל - מוזנק בעת ארוע או כמה ארועים
create trigger t1 on [dbo].[Products_tbl] for insert
as
begin
	--print 'טריגר'
end

--הפעלה של הטריגר
--פעולת הוספה
 insert into [dbo].[Products_tbl]
 values('מטריה',15)

 --כדי לשנות תחביר של טריגר alter
 --הטריגר קורה לפני פקודת הDML
 --ולכן משמש בעיקר לבדיקות תקינות דינמאיות
 --לבדוק מלאי קיים
 --האילוצים של הטבלה הם בדיקות תקינות סטטיות

 --=====טרנזקציות======
 --קטע קוד שמתבצע בשלמות
 --או מתבצע הכל --commit
 --או לא מתבצע כלום--rollback

alter trigger t1 on [dbo].[Products_tbl] for insert
as
begin
	print 'טריגר'
	rollback
end
--התוצאה היא 
--טריגר
--Msg 3609, Level 16, State 1, Line 14
--The transaction ended in the trigger. The batch has been aborted.
--אין את פעולת ההכנסה

alter trigger t1 on [dbo].[Products_tbl] for insert
as
begin
	insert into [dbo].[Employee_tbl] ([EmpID],[LastName],[FirstName])
	values(123454,'dsd','sasa')
	rollback
end

--========טבלאות זמניות=====
--היות וכל טריגר מקושר רק לטבלה אחת
--באוטומט יש טבלה זמנית שנוצרת ונמחקת בזמן הפעלת הטריגר
--והיא מכילה את הפרטים עבור הרשומה הרלוונטית
-- בפקודת מחיקה
--deleted--מכילה את השורה הנמחקת
--בפקדות הוספה
--inserted--מכילה את השורה החדשה
--בפקודת עדכון
--deleted--מכילה את השורה לפני השינוי
--inserted--מכיל את השורה אחרי השינוי

create trigger t2 on[dbo].[Products_tbl] for insert
as
begin
	select * from inserted
end

--טריגר של עדכון
alter trigger t2 on[dbo].[Products_tbl] for update
as
begin
--יש אפשרות לשאול את מה מעדכנים
if UPDATE([Cost])
	select * from inserted
end


update [Products_tbl]
set Cost=100
where [ProdDesc]='מגפיים'