-- CreateEnum
CREATE TYPE "Event" AS ENUM ('Single', 'League', 'Tournament', 'Knockout');

-- CreateTable
CREATE TABLE "OtherInformation" (
    "id" SERIAL NOT NULL,
    "bio" TEXT NOT NULL,
    "Skills" TEXT[],
    "languages" TEXT[],
    "user_id" TEXT NOT NULL,

    CONSTRAINT "OtherInformation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Achivement" (
    "achivement_id" TEXT NOT NULL,
    "name_of_event" TEXT NOT NULL,
    "event" "Event" NOT NULL,
    "level" "Level" NOT NULL,
    "position" INTEGER NOT NULL,
    "organised_by" TEXT NOT NULL,
    "event_date" TIMESTAMP(3) NOT NULL,
    "player_id" TEXT NOT NULL,

    CONSTRAINT "Achivement_pkey" PRIMARY KEY ("achivement_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "OtherInformation_user_id_key" ON "OtherInformation"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Achivement_player_id_key" ON "Achivement"("player_id");

-- AddForeignKey
ALTER TABLE "OtherInformation" ADD CONSTRAINT "OtherInformation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Achivement" ADD CONSTRAINT "Achivement_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
