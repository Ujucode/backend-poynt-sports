-- CreateEnum
CREATE TYPE "Level" AS ENUM ('District', 'State', 'National');

-- CreateTable
CREATE TABLE "PlayingCareer" (
    "playingCareer_id" TEXT NOT NULL,
    "highest_level" "Level" NOT NULL
);

-- CreateTable
CREATE TABLE "Game" (
    "id" TEXT NOT NULL,
    "played_for" TEXT NOT NULL,
    "level" "Level" NOT NULL,
    "played_from" TIMESTAMP(3) NOT NULL,
    "played_to" TIMESTAMP(3) NOT NULL,
    "player_id" TEXT NOT NULL,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PlayingCareer_playingCareer_id_key" ON "PlayingCareer"("playingCareer_id");

-- CreateIndex
CREATE UNIQUE INDEX "Game_player_id_key" ON "Game"("player_id");

-- AddForeignKey
ALTER TABLE "PlayingCareer" ADD CONSTRAINT "PlayingCareer_playingCareer_id_fkey" FOREIGN KEY ("playingCareer_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "PlayingCareer"("playingCareer_id") ON DELETE RESTRICT ON UPDATE CASCADE;
