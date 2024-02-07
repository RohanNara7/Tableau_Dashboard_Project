-----------------------------------KPI------------------------------------------------------------------------------

Select * from Bank_loan_data

Select Count(id) [Total_Loan_Applications] from Bank_loan_data

Select Count(id) [Month_to_date_Total_Loan_Applications] from Bank_loan_data
where month(issue_date) =12 and year(issue_date)= 2021

Select Count(id) [Previous_Month_to_date_Total_Loan_Applications] from Bank_loan_data
where month(issue_date) =11 and year(issue_date)= 2021

--MOM=(MTD-PMTD)/PMTD---

Select SUM(loan_amount) [Total_Funded_amount] from Bank_loan_data

Select SUM(loan_amount) [MTD_Total_Funded_amount] from Bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

Select SUM(loan_amount) [PMTD_Total_Funded_amount] from Bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021


Select sum(total_payment) [Total_amount_recevied] from Bank_loan_data

Select sum(total_payment) [MTD_Total_amount_recevied] from Bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

Select sum(total_payment) [PMTD_Total_amount_recevied] from Bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

Select round(Avg(int_rate),4) * 100 [Avg_interest_rate] from Bank_loan_data

Select round(Avg(int_rate),4) * 100 [MTD_Avg_interest_rate] from Bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

Select round(Avg(int_rate),4) * 100 [PMTD_Avg_interest_rate] from Bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

select round(avg(dti),4) *100 [Avg_DTI] from Bank_loan_data

select round(avg(dti),4) *100 [MTD_Avg_DTI] from Bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

select round(avg(dti),4) *100 [PMTD_Avg_DTI] from Bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

---------------------------------------------------------------------------------------------------------------------------------------------------------

Select loan_status from Bank_loan_data

Select
      (Count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100)
	  /
	  count(id) [Good_Loan_Percentage]
	  from Bank_loan_data

Select count(id) [Good_Loan_Applications] from Bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

Select sum(loan_amount) [Good_Loan_funded_amount] from Bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

Select sum(total_payment) [Good_Loan_amount_recevied] from Bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

Select
      (Count(case when loan_status='Charged Off' then id end)*100.0)
	  /
	  count(id) [Bad_Loan_Percentage]
	  from Bank_loan_data

Select count(id) [Bad_Loan_Applications] from Bank_loan_data
where loan_status='Charged Off'

Select sum(loan_amount) [Bad_Loan_funded_amount] from Bank_loan_data
where loan_status='Charged Off'

Select sum(total_payment) [Bad_Loan_amount_recevied] from Bank_loan_data
where loan_status='Charged Off'

----------------------------------------------------------------------------------------------------------------------------------

Select loan_status, count(id) [Total_Loan_Applications], SUM(loan_amount) [Total_Funded_amount], sum(total_payment) [Total_amount_recevied],
avg(int_rate *100)[Interest_Rate], avg(dti *100)[DTI]
from Bank_loan_data
group by loan_status

Select loan_status, SUM(loan_amount) [MTD_Total_Funded_amount], sum(total_payment) [MTD_Total_amount_recevied]
from Bank_loan_data
where month(issue_date)=12
group by loan_status

Select loan_status, SUM(loan_amount) [PMTD_Total_Funded_amount], sum(total_payment) [PMTD_Total_amount_recevied]
from Bank_loan_data
where month(issue_date)=11
group by loan_status

Select month(issue_date) [Month_no], datename(month,issue_date) [Month_name], count(id) [Total_loan_Applications], 
sum(loan_amount) [Total_funded_amount], sum(total_payment)[Total_recevied_amount]
from Bank_loan_data
group by month(issue_date), datename(month,issue_date)
order by month(issue_date)

Select address_state, count(id) [Total_loan_Applications], 
sum(loan_amount) [Total_funded_amount], sum(total_payment)[Total_recevied_amount]
from Bank_loan_data
group by address_state
order by count(id) desc

Select term, count(id) [Total_loan_Applications], 
sum(loan_amount) [Total_funded_amount], sum(total_payment)[Total_recevied_amount]
from Bank_loan_data
group by term
order by term

Select emp_length, count(id) [Total_loan_Applications], 
sum(loan_amount) [Total_funded_amount], sum(total_payment)[Total_recevied_amount]
from Bank_loan_data
group by emp_length
order by count(id) desc

Select purpose, count(id) [Total_loan_Applications], 
sum(loan_amount) [Total_funded_amount], sum(total_payment)[Total_recevied_amount]
from Bank_loan_data
group by purpose
order by count(id) desc

Select home_ownership, count(id) [Total_loan_Applications], 
sum(loan_amount) [Total_funded_amount], sum(total_payment)[Total_recevied_amount]
from Bank_loan_data
group by home_ownership
order by count(id) desc


