-- CreateTable
CREATE TABLE "Info" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "role" TEXT NOT NULL,
    "city_based" TEXT NOT NULL,
    "country_based" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "bio" TEXT NOT NULL,
    "first_paragraph" TEXT NOT NULL,
    "second_paragraph" TEXT NOT NULL,
    "third_paragraph" TEXT NOT NULL,
    "hero_image" VARCHAR(255) NOT NULL,
    "about_image" VARCHAR(255) NOT NULL,

    CONSTRAINT "Info_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stack" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "description" TEXT NOT NULL,
    "logo" VARCHAR(255) NOT NULL,

    CONSTRAINT "Stack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "thumbnail" VARCHAR(255),
    "type" TEXT NOT NULL DEFAULT 'automacao',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "posted_at" TIMESTAMP(3),
    "categoryId" INTEGER,
    "github_link" VARCHAR(255),
    "live_demo_link" VARCHAR(255),
    "is_featured" BOOLEAN NOT NULL DEFAULT false,
    "is_published" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "thumbnail" VARCHAR(255),
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contributor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "Contributor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contact" (
    "id" SERIAL NOT NULL,
    "contactId" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "message" TEXT NOT NULL,

    CONSTRAINT "Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_InfoToStack" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ProjectToStack" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ProjectToContributor" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Info_email_key" ON "Info"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_InfoToStack_AB_unique" ON "_InfoToStack"("A", "B");

-- CreateIndex
CREATE INDEX "_InfoToStack_B_index" ON "_InfoToStack"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProjectToStack_AB_unique" ON "_ProjectToStack"("A", "B");

-- CreateIndex
CREATE INDEX "_ProjectToStack_B_index" ON "_ProjectToStack"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProjectToContributor_AB_unique" ON "_ProjectToContributor"("A", "B");

-- CreateIndex
CREATE INDEX "_ProjectToContributor_B_index" ON "_ProjectToContributor"("B");

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InfoToStack" ADD CONSTRAINT "_InfoToStack_A_fkey" FOREIGN KEY ("A") REFERENCES "Info"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InfoToStack" ADD CONSTRAINT "_InfoToStack_B_fkey" FOREIGN KEY ("B") REFERENCES "Stack"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectToStack" ADD CONSTRAINT "_ProjectToStack_A_fkey" FOREIGN KEY ("A") REFERENCES "Project"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectToStack" ADD CONSTRAINT "_ProjectToStack_B_fkey" FOREIGN KEY ("B") REFERENCES "Stack"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectToContributor" ADD CONSTRAINT "_ProjectToContributor_A_fkey" FOREIGN KEY ("A") REFERENCES "Contributor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectToContributor" ADD CONSTRAINT "_ProjectToContributor_B_fkey" FOREIGN KEY ("B") REFERENCES "Project"("id") ON DELETE CASCADE ON UPDATE CASCADE;
