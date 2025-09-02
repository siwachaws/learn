CREATE PROCEDURE INCREASE_SALARIES 
AS
cursor c_emps is SELECT * FROM employees_copy for UPDATE;
v_salary_increase PLS_INTEGER := 1.10;
v_old_salary PLS_INTEGER;
BEGIN   
    FOR r_emp in c_emps LOOP
    v_old_salary := r_emp.salary;
    r_emp.salary:= r_emp.salary*v_salary_increase + r_emp.salary * nvl(r_emp.commission_pct,0);
    update employees_copy set row = r_emp where current of c_emps;
    DBMS_OUTPUT.PUT_LINE('The salary of : ' || r_emp.employee_id || ' is increased from '|| v_old_salary || ' to ' || r_emp_salary);
    end loop;
end;