import Link from "next/link";
import { publicConfig } from "@/lib/config";

export function HeroSection() {
  return (
    <section className="bg-brand-primary text-brand-textLight">
      <div className="mx-auto max-w-6xl px-4 py-20 sm:px-6">
        <p className="mb-3 text-sm uppercase tracking-[0.2em] text-brand-bgLight">
          {publicConfig.businessCity} • {publicConfig.businessState}
        </p>
        <h1 className="max-w-3xl text-4xl font-extrabold leading-tight sm:text-5xl">
          {publicConfig.businessName}
        </h1>
        <p className="mt-4 max-w-2xl text-lg text-brand-bgLight">
          {publicConfig.businessTagline}
        </p>
        <div className="mt-8">
          <Link
            href="/contact"
            className="inline-flex rounded-lg bg-brand-secondary px-5 py-3 text-sm font-semibold text-white hover:opacity-90"
          >
            Request Service
          </Link>
        </div>
      </div>
    </section>
  );
}
