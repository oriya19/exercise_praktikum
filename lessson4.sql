--=================�������=�������============
--����� �� ��� ��� ��� ���� �� �����
--���� ����� DML
--����� ������ ����� ��� ���
--������ - ����� ��� ���� �� ��� ������
create trigger t1 on [dbo].[Products_tbl] for insert
as
begin
	--print '�����'
end

--����� �� ������
--����� �����
 insert into [dbo].[Products_tbl]
 values('�����',15)

 --��� ����� ����� �� ����� alter
 --������ ���� ���� ����� �DML
 --���� ���� ����� ������� ������ ��������
 --����� ���� ����
 --�������� �� ����� �� ������ ������ ������

 --=====���������======
 --��� ��� ������ ������
 --�� ����� ��� --commit
 --�� �� ����� ����--rollback

alter trigger t1 on [dbo].[Products_tbl] for insert
as
begin
	print '�����'
	rollback
end
--������ ��� 
--�����
--Msg 3609, Level 16, State 1, Line 14
--The transaction ended in the trigger. The batch has been aborted.
--��� �� ����� ������

alter trigger t1 on [dbo].[Products_tbl] for insert
as
begin
	insert into [dbo].[Employee_tbl] ([EmpID],[LastName],[FirstName])
	values(123454,'dsd','sasa')
	rollback
end

--========������ ������=====
--���� ��� ����� ����� �� ����� ���
--������� �� ���� ����� ������ ������ ���� ����� ������
--���� ����� �� ������ ���� ������ ���������
-- ������ �����
--deleted--����� �� ����� ������
--������ �����
--inserted--����� �� ����� �����
--������ �����
--deleted--����� �� ����� ���� ������
--inserted--���� �� ����� ���� ������

create trigger t2 on[dbo].[Products_tbl] for insert
as
begin
	select * from inserted
end

--����� �� �����
alter trigger t2 on[dbo].[Products_tbl] for update
as
begin
--�� ������ ����� �� �� �������
if UPDATE([Cost])
	select * from inserted
end


update [Products_tbl]
set Cost=100
where [ProdDesc]='������'