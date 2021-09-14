CREATE TABLE "public.sales" (
	"sales_id" integer NOT NULL,
	"update" TIMESTAMP NOT NULL,
	"new_car_id" integer NOT NULL,
	"old_car_id" integer NOT NULL,
	"price" DECIMAL NOT NULL,
	"client_id" integer NOT NULL,
	CONSTRAINT "sales_pk" PRIMARY KEY ("sales_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cars" (
	"car_id" serial NOT NULL,
	"manufacture_id" integer NOT NULL,
	"brand" varchar(255) NOT NULL,
	"year" varchar NOT NULL,
	"type" varchar NOT NULL,
	"price" DECIMAL NOT NULL,
	"client_id" varchar NOT NULL,
	CONSTRAINT "cars_pk" PRIMARY KEY ("car_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customer" (
	"customer_id" integer NOT NULL,
	"inventory_id" integer NOT NULL,
	"first_name" varchar NOT NULL,
	"last_name" varchar NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.inventory" (
	"inventory_id" integer NOT NULL,
	"update" TIMESTAMP NOT NULL,
	"manufacture_id" TIMESTAMP NOT NULL,
	"sales_id" integer NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("inventory_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.employees" (
	"employee_id" integer(20) NOT NULL,
	"first_name" varchar(100) NOT NULL,
	"last_name" varchar(100) NOT NULL,
	"address" varchar(100) NOT NULL,
	"pnone" integer(30) NOT NULL,
	"services_id" integer(30) NOT NULL,
	"sales_id" integer(30) NOT NULL,
	CONSTRAINT "employees_pk" PRIMARY KEY ("employee_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.car_dealership_store" (
	"store_id" integer(30) NOT NULL,
	"address" varchar(100) NOT NULL,
	"employee_id" varchar(100) NOT NULL,
	"phone" integer(50) NOT NULL,
	CONSTRAINT "car_dealership_store_pk" PRIMARY KEY ("store_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.client" (
	"sales_id" integer NOT NULL,
	"client_id" integer NOT NULL,
	"first_name" varchar NOT NULL,
	"last_name" varchar NOT NULL,
	"address" varchar NOT NULL,
	CONSTRAINT "client_pk" PRIMARY KEY ("client_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.manufacture" (
	"manufacture_id" integer NOT NULL,
	"factory_name" varchar NOT NULL,
	"factory_manager" varchar(255) NOT NULL,
	"items_name" varchar NOT NULL,
	"items_price" DECIMAL NOT NULL,
	"factory_location" varchar NOT NULL,
	"factory_phone" varchar NOT NULL,
	CONSTRAINT "manufacture_pk" PRIMARY KEY ("manufacture_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.services" (
	"services_id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"employee_id" integer NOT NULL,
	"services_name" varchar NOT NULL,
	"services_price" DECIMAL NOT NULL,
	CONSTRAINT "services_pk" PRIMARY KEY ("services_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.salaries" (
	"salaries_id" integer NOT NULL,
	"employee_id" integer NOT NULL,
	"bank_account" integer NOT NULL,
	"update" TIMESTAMP NOT NULL,
	"amount" FLOAT NOT NULL,
	CONSTRAINT "salaries_pk" PRIMARY KEY ("salaries_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("new_car_id") REFERENCES "cars"("car_id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk1" FOREIGN KEY ("old_car_id") REFERENCES "payment"("payment_id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk2" FOREIGN KEY ("client_id") REFERENCES "client"("client_id");

ALTER TABLE "cars" ADD CONSTRAINT "cars_fk0" FOREIGN KEY ("manufacture_id") REFERENCES "manufacture"("manufacture_id");
ALTER TABLE "cars" ADD CONSTRAINT "cars_fk1" FOREIGN KEY ("client_id") REFERENCES "client"("client_id");

ALTER TABLE "customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("inventory_id");

ALTER TABLE "inventory" ADD CONSTRAINT "inventory_fk0" FOREIGN KEY ("manufacture_id") REFERENCES "manufacture"("manufacture_id");
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_fk1" FOREIGN KEY ("sales_id") REFERENCES "sales"("sales_id");

ALTER TABLE "employees" ADD CONSTRAINT "employees_fk0" FOREIGN KEY ("services_id") REFERENCES "services"("services_id");
ALTER TABLE "employees" ADD CONSTRAINT "employees_fk1" FOREIGN KEY ("sales_id") REFERENCES "sales"("sales_id");

ALTER TABLE "car_dealership_store" ADD CONSTRAINT "car_dealership_store_fk0" FOREIGN KEY ("employee_id") REFERENCES "employees"("employee_id");

ALTER TABLE "client" ADD CONSTRAINT "client_fk0" FOREIGN KEY ("sales_id") REFERENCES "sales"("sales_id");


ALTER TABLE "services" ADD CONSTRAINT "services_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE "services" ADD CONSTRAINT "services_fk1" FOREIGN KEY ("employee_id") REFERENCES "employees"("employee_id");

ALTER TABLE "salaries" ADD CONSTRAINT "salaries_fk0" FOREIGN KEY ("employee_id") REFERENCES "employees"("employee_id");











