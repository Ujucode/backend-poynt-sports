-- CreateTable
CREATE TABLE "Fee" (
    "fee_id" TEXT NOT NULL,
    "coaching_level" "Level" NOT NULL,
    "fee_type" TEXT NOT NULL,
    "numer_of_classes" INTEGER NOT NULL,
    "duration" TIMESTAMP(3) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Fee_fee_id_key" ON "Fee"("fee_id");

-- AddForeignKey
ALTER TABLE "Fee" ADD CONSTRAINT "Fee_fee_id_fkey" FOREIGN KEY ("fee_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
