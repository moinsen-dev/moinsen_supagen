-- Erzeugen der Tabelle 'User'
CREATE TABLE "User" (
    "id" SERIAL PRIMARY KEY,
    "email" VARCHAR(255) UNIQUE NOT NULL,
    "name" VARCHAR(255)
);

-- Erzeugen der Tabelle 'Post'
CREATE TABLE "Post" (
    "id" SERIAL PRIMARY KEY,
    "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "title" VARCHAR(255) NOT NULL,
    "content" TEXT,
    "published" BOOLEAN DEFAULT FALSE,
    "viewCount" INT DEFAULT 0,
    "authorId" INT REFERENCES "User"("id"),
    CONSTRAINT "idx_title_createdAt" UNIQUE ("title", "createdAt")
);

-- Automatisches Aktualisieren des updatedAt Feldes in der Tabelle 'Post' bei jeder Änderung
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW."updatedAt" = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_post_updated_at
BEFORE UPDATE ON "Post"
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
