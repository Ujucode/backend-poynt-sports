/*
  Warnings:

  - The values [COACHES] on the enum `Role` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the `Game` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[playingCareer_id,careerType]` on the table `PlayingCareer` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `careerType` to the `PlayingCareer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `Subscriber` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phone` to the `Subscriber` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Career" AS ENUM ('Current', 'Previous');

-- AlterEnum
BEGIN;
CREATE TYPE "Role_new" AS ENUM ('ATHLETE', 'COACH', 'MENTOR');
ALTER TABLE "User" ALTER COLUMN "type" TYPE "Role_new" USING ("type"::text::"Role_new");
ALTER TYPE "Role" RENAME TO "Role_old";
ALTER TYPE "Role_new" RENAME TO "Role";
DROP TYPE "Role_old";
COMMIT;

-- DropForeignKey
ALTER TABLE "Achivement" DROP CONSTRAINT "Achivement_player_id_fkey";

-- DropForeignKey
ALTER TABLE "BankAccountDetail" DROP CONSTRAINT "BankAccountDetail_userId_fkey";

-- DropForeignKey
ALTER TABLE "BirthAddress" DROP CONSTRAINT "BirthAddress_userId_fkey";

-- DropForeignKey
ALTER TABLE "CurrentAddress" DROP CONSTRAINT "CurrentAddress_userId_fkey";

-- DropForeignKey
ALTER TABLE "Education" DROP CONSTRAINT "Education_studentId_fkey";

-- DropForeignKey
ALTER TABLE "Fee" DROP CONSTRAINT "Fee_fee_id_fkey";

-- DropForeignKey
ALTER TABLE "Game" DROP CONSTRAINT "Game_player_id_fkey";

-- DropForeignKey
ALTER TABLE "OtherInformation" DROP CONSTRAINT "OtherInformation_user_id_fkey";

-- DropForeignKey
ALTER TABLE "ParmanentAddress" DROP CONSTRAINT "ParmanentAddress_userId_fkey";

-- DropForeignKey
ALTER TABLE "PlayingCareer" DROP CONSTRAINT "PlayingCareer_playingCareer_id_fkey";

-- AlterTable
ALTER TABLE "PlayingCareer" ADD COLUMN     "careerType" "Career" NOT NULL,
ADD COLUMN     "playedFor" TEXT[];

-- AlterTable
ALTER TABLE "Subscriber" ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "phone" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Game";

-- CreateTable
CREATE TABLE "PlayedFor" (
    "id" TEXT NOT NULL,
    "played_for" TEXT NOT NULL,
    "level" "Level" NOT NULL,
    "played_from" TIMESTAMP(3) NOT NULL,
    "played_to" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlayedFor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PlayingCareer_playingCareer_id_careerType_key" ON "PlayingCareer"("playingCareer_id", "careerType");

-- AddForeignKey
ALTER TABLE "OtherInformation" ADD CONSTRAINT "OtherInformation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CurrentAddress" ADD CONSTRAINT "CurrentAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParmanentAddress" ADD CONSTRAINT "ParmanentAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BirthAddress" ADD CONSTRAINT "BirthAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayingCareer" ADD CONSTRAINT "PlayingCareer_playingCareer_id_fkey" FOREIGN KEY ("playingCareer_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Achivement" ADD CONSTRAINT "Achivement_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fee" ADD CONSTRAINT "Fee_fee_id_fkey" FOREIGN KEY ("fee_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BankAccountDetail" ADD CONSTRAINT "BankAccountDetail_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
