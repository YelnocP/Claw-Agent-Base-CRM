import { SiteShell } from "@/components/website/SiteShell";
import { GalleryGrid } from "@/components/website/GalleryGrid";
import { getGalleryImages } from "@/lib/public-data";

export const dynamic = "force-dynamic";

export default async function GalleryPage() {
  const images = await getGalleryImages();

  return (
    <SiteShell>
      <section className="mx-auto max-w-6xl px-4 pt-10 sm:px-6">
        <h1 className="text-3xl font-bold text-brand-textDark">Gallery</h1>
        <p className="mt-2 text-slate-600">
          Browse recent work and project highlights.
        </p>
      </section>
      <GalleryGrid images={images} />
    </SiteShell>
  );
}
