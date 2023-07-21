-- CreateTable
CREATE TABLE "BankAccountDetail" (
    "bank_account_id" TEXT NOT NULL,
    "account_holder" TEXT NOT NULL,
    "account_number" INTEGER NOT NULL,
    "bank_name" TEXT NOT NULL,
    "branch_name" TEXT NOT NULL,
    "IFSC_code" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "BankAccountDetail_pkey" PRIMARY KEY ("bank_account_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "BankAccountDetail_account_number_key" ON "BankAccountDetail"("account_number");

-- CreateIndex
CREATE UNIQUE INDEX "BankAccountDetail_IFSC_code_key" ON "BankAccountDetail"("IFSC_code");

-- CreateIndex
CREATE UNIQUE INDEX "BankAccountDetail_userId_key" ON "BankAccountDetail"("userId");

-- AddForeignKey
ALTER TABLE "BankAccountDetail" ADD CONSTRAINT "BankAccountDetail_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
