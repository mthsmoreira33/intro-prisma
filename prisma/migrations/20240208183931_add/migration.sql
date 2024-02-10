-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('USER', 'ADMIN');

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL,
    "name" VARCHAR(60) NOT NULL,
    "last_name" VARCHAR(60) NOT NULL,
    "github_link" VARCHAR(255),
    "email" VARCHAR(50) NOT NULL,
    "password" VARCHAR(50) NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "role" "UserRole" NOT NULL DEFAULT 'USER',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product" (
    "id" UUID NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "value" DECIMAL(10,2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "type_product" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shop" (
    "cnpj" INTEGER NOT NULL,
    "name" VARCHAR(60) NOT NULL,
    "segment" VARCHAR(60) DEFAULT 'alimentação',
    "address" VARCHAR(100) NOT NULL,
    "telephone" INTEGER,
    "branch_quantity" INTEGER,
    "opening_date" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "supplier" (
    "id" UUID NOT NULL,
    "name" VARCHAR(60) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "rating" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "supplier_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "shop_cnpj_key" ON "shop"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "supplier_email_key" ON "supplier"("email");
