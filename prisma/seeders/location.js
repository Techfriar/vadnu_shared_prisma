import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function seedLocation() {
  const locations = [
    { name: "Kochin", slug: "kochin" },
    { name: "Mumbai", slug: "mumbai" },
    { name: "Banglore", slug: "banglore" },
    { name: "Delhi", slug: "delhi" },
    { name: "Calicut", slug: "calicut" },
  ];
  try {
    for (const location of locations) {
      await prisma.location.upsert({
        where: { slug: location.slug },
        update: {},
        create: {
          name: location.name,
          slug: location.slug,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      });
    }
  } catch (error) {
    console.error(error);
    console.error("Error seeding location");
  }
}
