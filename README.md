# vadnu_shared_prisma


yarn add prisma @prisma/client
npx prisma generate


In each repository, add the shared library as a dependency. If it’s a local library, use a relative path:
yarn add file:../vadnu_shared_prisma


// Example usage in candidate and company repos
import { prisma } from 'vadnu-shared-prisma';

async function getUser() {
  const user = await prisma.user.findMany();
  console.log(user);
}