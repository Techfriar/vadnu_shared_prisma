import { PrismaClient } from "@prisma/client";
// Initialize the Prisma Client
const prisma = new PrismaClient();

// Function to seed currencies into the database
export default async function seedCurrencies() {
  const currencies = [
    {
      country: "United States of America",
      name: "United States Dollar",
      code: "USD",
      symbol: "$",
    },
  ];
  try {
    // Iterate through the array of currencies and upsert each one
    await Promise.all(
      currencies.map((currency) =>
        prisma.currency.upsert({
          where: { code: currency.code },
          update: {},
          create: {
            name: currency.name,
            code: currency.code,
            country: currency.country,
            symbol: currency.symbol,
            createdAt: new Date(),
            updatedAt: new Date(),
          },
        })
      )
    );
  } catch (error) {
    console.error("Error seeding currencies:", error);
  }
}
