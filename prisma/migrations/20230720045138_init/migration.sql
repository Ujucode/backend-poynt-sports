-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ATHLETE', 'COACHES');

-- CreateEnum
CREATE TYPE "Blood" AS ENUM ('A', 'B', 'O');

-- CreateEnum
CREATE TYPE "Religion" AS ENUM ('Hindu', 'Muslim');

-- CreateEnum
CREATE TYPE "Sport" AS ENUM ('Akaido', 'Karate');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('Male', 'Femal', 'Other');

-- CreateTable
CREATE TABLE "Subscriber" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "Subscriber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "phone" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "DOB" TIMESTAMP(3) NOT NULL,
    "sport" "Sport" NOT NULL,
    "photo" TEXT[],
    "gender" "Gender" NOT NULL,
    "religion" "Religion" NOT NULL,
    "BloodGroup" "Blood" NOT NULL,
    "password" TEXT NOT NULL,
    "type" "Role" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Institute" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Institute_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CurrentAddress" (
    "current_address_id" TEXT NOT NULL,
    "addressLine" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "pincode" INTEGER NOT NULL,
    "country" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "CurrentAddress_pkey" PRIMARY KEY ("current_address_id")
);

-- CreateTable
CREATE TABLE "ParmanentAddress" (
    "parmanent_address_id" TEXT NOT NULL,
    "addressLine" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "pincode" INTEGER NOT NULL,
    "country" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "ParmanentAddress_pkey" PRIMARY KEY ("parmanent_address_id")
);

-- CreateTable
CREATE TABLE "BirthAddress" (
    "birth_address_id" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "BirthAddress_pkey" PRIMARY KEY ("birth_address_id")
);

-- CreateTable
CREATE TABLE "Education" (
    "education_id" TEXT NOT NULL,
    "institute" TEXT NOT NULL,
    "degree" TEXT NOT NULL,
    "fieldOfStudy" TEXT NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "Grade" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("education_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Subscriber_email_key" ON "Subscriber"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "CurrentAddress_userId_key" ON "CurrentAddress"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ParmanentAddress_userId_key" ON "ParmanentAddress"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "BirthAddress_userId_key" ON "BirthAddress"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Education_studentId_key" ON "Education"("studentId");

-- AddForeignKey
ALTER TABLE "CurrentAddress" ADD CONSTRAINT "CurrentAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParmanentAddress" ADD CONSTRAINT "ParmanentAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BirthAddress" ADD CONSTRAINT "BirthAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
