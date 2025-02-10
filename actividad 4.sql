DROP DATABASE IF EXISTS empleados;
CREATE DATABASE IF NOT EXISTS empleados;
USE empleados;

DROP TABLE IF EXISTS dept_emp,
                     empleado, 
                     departamento;

CREATE TABLE empleado (
    cod_empleado      INT             NOT NULL,
    fecha_nacimiento  DATE            NOT NULL,
    nombre  VARCHAR(14)     NOT NULL,
    apellido   VARCHAR(16)     NOT NULL,
    sexo      ENUM ('M','F')  NOT NULL,    
    fecha_contratacion  DATE            NOT NULL,
    PRIMARY KEY (cod_empleado)
);

CREATE TABLE departamento (
    cod_departamento     CHAR(4)         NOT NULL,
    nombre_departamento   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (cod_departamento),
    UNIQUE  KEY (nombre_departamento)
);

CREATE TABLE dept_emp (
    cod_empleado      INT             NOT NULL,
    cod_departamento     CHAR(4)         NOT NULL,
    salario decimal (7,2),
    fecha_desde   DATE            NOT NULL,
    fecha_hasta     DATE            NOT NULL,
    FOREIGN KEY (cod_empleado)  REFERENCES empleado   (cod_empleado)  ON DELETE CASCADE,
    FOREIGN KEY (cod_departamento) REFERENCES departamento (cod_departamento) ON DELETE CASCADE,
    PRIMARY KEY (cod_empleado,cod_departamento)
);

INSERT INTO `empleado` VALUES (10001,'1953-09-02','Georgi','Facello','M','2021-06-26'),
(10002,'1964-06-02','Bezalel','Simmel','F','2018-11-21'),
(10003,'1979-12-03','Parto','Bamford','M','2019-08-28'),
(10004,'1982-05-01','Chirstian','Koblick','M','2022-12-01'),
(10005,'1983-01-21','Kyoichi','Maliniak','M','2019-09-12'),
(10006,'1990-04-20','Anneke','Preusig','F','2018-06-02'),
(10007,'1965-05-23','Tzvetan','Zielinski','F','2018-02-10'),
(10008,'1990-02-19','Saniya','Kalloufi','M','2021-09-15'),
(10009,'1991-04-19','Sumant','Peac','F','2019-02-18'),
(10010,'1978-06-01','Duangkaew','Piveteau','F','2018-08-24'),
(10011,'1972-11-07','Mary','Sluis','F','2018-01-22'),
(10012,'1988-09-02','Lucas','Perez','M','2019-06-26');

INSERT INTO `departamento` VALUES 
('d001','Marketing'),
('d002','Finance'),
('d003','Human Resources'),
('d004','Production'),
('d005','Development'),
('d006','Quality Management'),
('d007','Sales'),
('d008','Research'),
('d009','Customer Service'),
('d010','IT');

INSERT INTO `dept_emp` VALUES (10001,'d006','34000','2021-06-26','9999-01-01'),
(10002,'d006','20000','2018-11-21','9999-01-01'),
(10003,'d004','22000','2019-08-28','9999-01-01'),
(10004,'d004','29500','2022-12-01','9999-01-01'),
(10005,'d004','32000','2019-09-12','9999-01-01'),
(10006,'d005','19500','2018-06-02','9999-01-01'),
(10007,'d008','30000','2018-02-10','9999-01-01'),
(10008,'d006','29500','2021-09-15','2022-07-31'),
(10009,'d006','31250','2019-02-18','9999-01-01'),
(10010,'d004','33000','2018-08-24','2020-10-11'),
(10010,'d006','36000','2020-10-12','9999-01-01'),
(10011,'d005','26000','2018-01-22','2019-09-10'),
(10012,'d005','27000','2019-06-26','9999-01-01');

select e.nombre , d.nombre_departamento
from empleado e
join dept_emp de on e.cod_empleado = de.cod_empleado
join departamento d on de.cod_departamento = d.cod_departamento
where  d.cod_departamento = 'd006';

select e.nombre, e.apellido, de.salario
from empleado e
join dept_emp de on e.cod_empleado = de.cod_empleado
join departamento d on de.cod_departamento = d.cod_departamento
where d.cod_departamento = 'd005'
order by de.salario desc
limit 1;

select e.nombre, e.apellido, de.fecha_desde
from empleado e
join dept_emp de on e.cod_empleado = de.cod_empleado
join departamento d on de.cod_departamento = d.cod_departamento
where d.cod_departamento = 'd004'
order by de.fecha_desde desc
limit 1;

select avg(de.salario)
from empleado e
join dept_emp de on e.cod_empleado = de.cod_empleado
join departamento d on de.cod_departamento = d.cod_departamento
where d.cod_departamento = 'd004';

select e.nombre, e.apellido, e.fecha_contratacion, de.salario
from empleado e
join dept_emp de on e.cod_empleado = de.cod_empleado
join departamento d on de.cod_departamento = d.cod_departamento
where d.cod_departamento = 'd004'
order by de.salario asc
limit 1;

select e.nombre, e.apellido, e.sexo, de.salario
from empleado e
join dept_emp de on e.cod_empleado = de.cod_empleado
join departamento d on de.cod_departamento = d.cod_departamento
order by de.salario asc;

select e.sexo, avg(de.salario)
from dept_emp de
join empleado e on e.cod_empleado = de.cod_empleado
group by e.sexo;

select e.nombre, d.nombre_departamento, sum(de.salario)
from empleado e
join dept_emp de on d.cod_empleado = de.cod_empleado
where d.nombre_departamento = 'Development';

select sum(de.salario) as coste_total 
from dept_emp de 
where de.cod_departamento = 'd004' and de.fecha_hasta = '9999-01-01';

select d.nombre_departamento, count(*) as TOTAL_EMPLEADOS 
from dept_emp de 
join departamento d on de.cod_departamento = d.cod_departamento 
where de.fecha_hasta = '9999-01-01' group by de.cod_departamento
order by TOTAL_EMPLEADOS 
DESC LIMIT 1;