--drop procedure count_wgjyjsl

create procedure count_wgjyjsl
@begindate varchar(10),
@enddate varchar(10)
as 
begin
SET NOCOUNT ON 
create table #Data(
wgjyzs int default(0)
,wgjyasjh int default(0)
,wgjywasjh int default(0)
,wgjyjsl decimal(28,2) default(0)
,wgtoday int default(0)
)

Insert Into #Data(wgjyzs,wgjyasjh,wgjywasjh,wgtoday
)
select sum(1) as 'wgjyzs'
,sum(case when ( (datediff(day,a.FDate,case when d.FDate is not null and (d.FDate<c.FDate or c.FDate is null) then d.FDate else c.FDate end)<=1 
and a.FDate<>'2011-10-18' and a.FDate<>'2011-10-15' and a.FDate<>'2011-10-22'and a.FDate<>'2011-10-29'and a.FDate<>'2011-11-05'and a.FDate<>'2011-11-12'and a.FDate<>'2011-11-19'and a.FDate<>'2011-11-26'and a.FDate<>'2011-12-03'and a.FDate<>'2011-12-10'and a.FDate<>'2011-12-17'and a.FDate<>'2011-12-24'and a.FDate<>'2011-12-31'and a.FDate<>'2012-01-07'and a.FDate<>'2012-01-14'and a.FDate<>'2012-01-21'and a.FDate<>'2012-01-28'and a.FDate<>'2012-02-04'and a.FDate<>'2012-02-11'and a.FDate<>'2012-02-18'and a.FDate<>'2012-02-25'and a.FDate<>'2012-03-03'and a.FDate<>'2012-03-10'and a.FDate<>'2012-03-17'and a.FDate<>'2012-03-24'and a.FDate<>'2012-03-31'and a.FDate<>'2012-04-02'and a.FDate<>'2012-04-07'and a.FDate<>'2012-04-14'and a.FDate<>'2012-04-21'and a.FDate<>'2012-04-28'and a.FDate<>'2012-05-05'and a.FDate<>'2012-05-12'and a.FDate<>'2012-05-19'and a.FDate<>'2012-05-26'and a.FDate<>'2012-06-02'and a.FDate<>'2012-06-09'and a.FDate<>'2012-06-16'and a.FDate<>'2012-06-23'and a.FDate<>'2012-06-30'and a.FDate<>'2012-07-07'and a.FDate<>'2012-07-14'and a.FDate<>'2012-07-21'and a.FDate<>'2012-07-28'and a.FDate<>'2012-08-04'and a.FDate<>'2012-08-11'and a.FDate<>'2012-08-18'and a.FDate<>'2012-08-25'and a.FDate<>'2012-09-01'and a.FDate<>'2012-09-08'and a.FDate<>'2012-09-15'and a.FDate<>'2012-09-22'and a.FDate<>'2012-09-29'and a.FDate<>'2012-10-06'and a.FDate<>'2012-10-13'and a.FDate<>'2012-10-19'and a.FDate<>'2012-10-26'and a.FDate<>'2012-11-02'and a.FDate<>'2012-11-10'and a.FDate<>'2012-11-17'and a.FDate<>'2012-11-24'and a.FDate<>'2012-12-01'and a.FDate<>'2012-12-08'and a.FDate<>'2012-12-15'and a.FDate<>'2012-12-22'and a.FDate<>'2012-12-29'and a.FDate<>'2013-07-06'
and a.FDate<>'2013-07-15'
) or (a.FDate in (
'2011-10-18', '2011-10-15','2011-10-22','2011-10-29','2011-11-05','2011-11-12','2011-11-19','2011-11-26','2011-12-03','2011-12-10','2011-12-17','2011-12-24','2011-12-31','2012-01-07','2012-01-14','2012-01-21','2012-01-28','2012-02-04','2012-02-11','2012-02-18','2012-02-25','2012-03-03','2012-03-10','2012-03-17','2012-03-24','2012-03-31','2012-04-02','2012-04-07','2012-04-14','2012-04-21','2012-04-28','2012-05-05','2012-05-12','2012-05-19','2012-05-26','2012-06-02','2012-06-09','2012-06-16','2012-06-23','2012-06-30','2012-07-07','2012-07-14','2012-07-21','2012-07-28','2012-08-04','2012-08-11','2012-08-18','2012-08-25','2012-09-01','2012-09-08','2012-09-15','2012-09-22','2012-09-29','2012-10-06','2012-10-13','2012-10-20','2012-10-27','2012-11-03','2012-11-10','2012-11-17','2012-11-24','2012-12-01','2012-12-08','2012-12-15','2012-12-22','2012-12-29','2013-07-06',
'2013-07-15'
) and datediff(day,a.FDate,case when d.FDate is not null and (d.FDate<c.FDate or c.FDate is null) then d.FDate else c.FDate end)<=2)
or (a.FDate in ('2012-10-19','2012-10-26','2012-11-02') and datediff(day,a.FDate,case when d.FDate is not null and (d.FDate<c.FDate or c.FDate is null) then d.FDate else c.FDate end)<=3) ) then 1 else 0 end) as 'wgjyasjh'         --双休
,sum(case when (d.FDate is null and c.FDate is null and datediff(day,a.FDate,getDate())>1) or ( (datediff(day,a.FDate,case when d.FDate is not null and (d.FDate<c.FDate or c.FDate is null) then d.FDate else c.FDate end)>1
and a.FDate<>'2011-10-18' and a.FDate<>'2011-10-15' and a.FDate<>'2011-10-22'and a.FDate<>'2011-10-29'and a.FDate<>'2011-11-05'and a.FDate<>'2011-11-12'and a.FDate<>'2011-11-19'and a.FDate<>'2011-11-26'and a.FDate<>'2011-12-03'and a.FDate<>'2011-12-10'and a.FDate<>'2011-12-17'and a.FDate<>'2011-12-24'and a.FDate<>'2011-12-31'and a.FDate<>'2012-01-07'and a.FDate<>'2012-01-14'and a.FDate<>'2012-01-21'and a.FDate<>'2012-01-28'and a.FDate<>'2012-02-04'and a.FDate<>'2012-02-11'and a.FDate<>'2012-02-18'and a.FDate<>'2012-02-25'and a.FDate<>'2012-03-03'and a.FDate<>'2012-03-10'and a.FDate<>'2012-03-17'and a.FDate<>'2012-03-24'and a.FDate<>'2012-03-31'and a.FDate<>'2012-04-02'and a.FDate<>'2012-04-07'and a.FDate<>'2012-04-14'and a.FDate<>'2012-04-21'and a.FDate<>'2012-04-28'and a.FDate<>'2012-05-05'and a.FDate<>'2012-05-12'and a.FDate<>'2012-05-19'and a.FDate<>'2012-05-26'and a.FDate<>'2012-06-02'and a.FDate<>'2012-06-09'and a.FDate<>'2012-06-16'and a.FDate<>'2012-06-23'and a.FDate<>'2012-06-30'and a.FDate<>'2012-07-07'and a.FDate<>'2012-07-14'and a.FDate<>'2012-07-21'and a.FDate<>'2012-07-28'and a.FDate<>'2012-08-04'and a.FDate<>'2012-08-11'and a.FDate<>'2012-08-18'and a.FDate<>'2012-08-25'and a.FDate<>'2012-09-01'and a.FDate<>'2012-09-08'and a.FDate<>'2012-09-15'and a.FDate<>'2012-09-22'and a.FDate<>'2012-09-29'and a.FDate<>'2012-10-06'and a.FDate<>'2012-10-13'and a.FDate<>'2012-10-19'and a.FDate<>'2012-10-26'and a.FDate<>'2012-11-02'and a.FDate<>'2012-11-10'and a.FDate<>'2012-11-17'and a.FDate<>'2012-11-24'and a.FDate<>'2012-12-01'and a.FDate<>'2012-12-08'and a.FDate<>'2012-12-15'and a.FDate<>'2012-12-22'and a.FDate<>'2012-12-29'and a.FDate<>'2013-07-06'
and a.FDate<>'2013-07-15'
) or (a.FDate in (
'2011-10-18', '2011-10-15','2011-10-22','2011-10-29','2011-11-05','2011-11-12','2011-11-19','2011-11-26','2011-12-03','2011-12-10','2011-12-17','2011-12-24','2011-12-31','2012-01-07','2012-01-14','2012-01-21','2012-01-28','2012-02-04','2012-02-11','2012-02-18','2012-02-25','2012-03-03','2012-03-10','2012-03-17','2012-03-24','2012-03-31','2012-04-02','2012-04-07','2012-04-14','2012-04-21','2012-04-28','2012-05-05','2012-05-12','2012-05-19','2012-05-26','2012-06-02','2012-06-09','2012-06-16','2012-06-23','2012-06-30','2012-07-07','2012-07-14','2012-07-21','2012-07-28','2012-08-04','2012-08-11','2012-08-18','2012-08-25','2012-09-01','2012-09-08','2012-09-15','2012-09-22','2012-09-29','2012-10-06','2012-10-13','2012-10-20','2012-10-27','2012-11-03','2012-11-10','2012-11-17','2012-11-24','2012-12-01','2012-12-08','2012-12-15','2012-12-22','2012-12-29','2013-07-06',
'2013-07-15'
) and datediff(day,a.FDate,case when d.FDate is not null and (d.FDate<c.FDate or c.FDate is null) then d.FDate else c.FDate end)>2)
or (a.FDate in ('2012-10-19','2012-10-26','2012-11-02') and datediff(day,a.FDate,case when d.FDate is not null and (d.FDate<c.FDate or c.FDate is null) then d.FDate else c.FDate end)>3) ) then 1 else 0 end) as 'wgjywasjh'
--,CAST(sum(case when datediff(day,a.FDate,c.FDate)=0 then 1 else 0 end) as decimal(28,2))/CAST(sum(1) as decimal(28,2))*100 as 'wgjyjsl'
,sum(case when case when d.FDate is not null and (d.FDate<c.FDate or c.FDate is null) then d.FDate else c.FDate end is null and (datediff(day,a.FDate,getDate())<30) and a.FStatus=1 then 1 else 0 end) as 'wgtoday'
from POInstock a 
INNER JOIN POInstockEntry b ON  a.FInterID = b.FInterID  AND b.FInterID<>0 
LEFT JOIN t_ICItem i on b.FItemID = i.FItemID 
LEFT JOIN t_MeasureUnit mu on mu.FItemID=b.FUnitID 
left join (select u1.FSourceInterID,u1.FSourceEntryID,MIN(v1.FMultiCheckDate1) as FDate from ICStockBill v1 INNER JOIN ICStockBillEntry u1 ON v1.FInterID = u1.FInterID   AND u1.FInterID <>0 where 1=1 AND v1.FTranType=1 AND  v1.FCancellation = 0 AND u1.FSourceInterID>0 group by u1.FSourceInterID,u1.FSourceEntryID) c on c.FSourceInterID=b.FInterID and c.FSourceEntryID=b.FEntryID
left join (select FInStockInterID,FSerialID,MIN(case when FResult=286 then null else FDate end) as FDate from ICQCBill where FTranType=711 AND FCancellation = 0 group by FInStockInterID,FSerialID) d on d.FInStockInterID=b.FInterID and d.FSerialID=b.FEntryID         --不合格
where 1=1
AND (a.FTranType=702 AND (A.FCancellation = 0))
AND a.FStatus > 0
AND a.FDate>=@begindate AND a.FDate<=@enddate

select wgjyzs,wgjyasjh,wgjywasjh,wgjyjsl=convert(decimal(28,2),convert(decimal(28,2),wgjyzs-wgjywasjh)/wgjyzs*100),wgtoday from #Data
end

execute count_wgjyjsl '2013-10-01','2013-10-31'




select FInStockInterID,FSerialID,MIN(case when FResult=286 then null else FDate end) as FDate from ICQCBill where FTranType=711 AND FCancellation = 0 AND FInterID=15776 group by FInStockInterID,FSerialID

select * from ICStockBill where FBillNo='win002852'


select * from ICStockBill v1 INNER JOIN ICStockBillEntry u1 ON v1.FInterID = u1.FInterID   AND u1.FInterID <>0 where 1=1 AND v1.FTranType=1 AND  v1.FCancellation = 0 AND u1.FSourceInterID>0

--ycjyhgl 287:不合格

select sum(1) as 'pczs'
,sum(case when a.FResult=286 then 1 else 0 end) as 'hgs'
,sum(case when a.FResult<>286 then 1 else 0 end) as 'bhgs'
,sum(case when b.FDefectHandlingID = 1077 then 1 else 0 end) as 'rbjss'
,sum(case when b.FDefectHandlingID =1036 then 1 else 0 end) as 'jss'
from ICQCBill a
left join (select a.FBillNo_SRC,b.FDefectHandlingID from QMReject a left join QMRejectEntry b on a.FID=b.FID group by FBillNo_SRC,b.FDefectHandlingID) b on a.FBillNo=b.FBillNo_SRC
where a.FTranType=711 AND a.FCancellation=0
and a.FCheckDate>='2012-11-01' and a.FCheckDate<='2012-11-30'
and a.FResult <> 13556




