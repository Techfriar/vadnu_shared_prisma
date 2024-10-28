// index.js in shared-library
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();
export { prisma };
