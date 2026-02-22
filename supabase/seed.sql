-- Alpine Outdoor Living — Seed Data
-- Demo records for development and initial launch.

insert into public.contacts (first_name, last_name, phone, email, source, notes, tags)
values
  ('Sarah', 'Mitchell', '(217) 555-1200', 'sarah.mitchell@example.com', 'website_form', 'Interested in backyard patio with fire pit. Has large yard.', array['new_lead']),
  ('Dave', 'Hernandez', '(217) 555-3400', 'dave.hernandez@example.com', 'referral', 'Referred by a neighbor. Wants a water feature for front yard.', array['referral']),
  ('Lisa', 'Thompson', '(217) 555-5600', 'lisa.thompson@example.com', 'instagram', 'Saw our portfolio on Instagram. Interested in full outdoor kitchen.', array['high_value'])
on conflict do nothing;

insert into public.leads (contact_id, service_needed, preferred_date, message, status, source, assigned_to)
select c.id, 'Patios', 'Next week', 'We want a large flagstone patio with a built-in fire pit area. Budget around $15-20k.', 'new', 'website_form', 'Austin'
from public.contacts c where c.email = 'sarah.mitchell@example.com' limit 1;

insert into public.leads (contact_id, service_needed, preferred_date, message, status, source, assigned_to)
select c.id, 'Water Features', 'Flexible', 'Looking for a pondless waterfall in the front yard. Want something natural-looking.', 'contacted', 'referral', 'Austin'
from public.contacts c where c.email = 'dave.hernandez@example.com' limit 1;

insert into public.leads (contact_id, service_needed, preferred_date, message, status, source, assigned_to)
select c.id, 'Outdoor Kitchens', 'Spring 2026', 'Full outdoor kitchen — grill, countertop, sink, mini fridge. Want to see a design.', 'quoted', 'instagram', 'Austin'
from public.contacts c where c.email = 'lisa.thompson@example.com' limit 1;

insert into public.appointments (contact_id, title, start_time, end_time, address, service, assigned_to, status)
select c.id,
       'Site Visit — Patio & Fire Pit',
       now() + interval '3 day',
       now() + interval '3 day 1 hour',
       '1420 Meadowbrook Ln, Springfield, IL',
       'Patios',
       'Austin',
       'scheduled'
from public.contacts c where c.email = 'sarah.mitchell@example.com' limit 1;

insert into public.jobs (contact_id, title, status, service, assigned_to, scheduled_date, invoice_amount)
select c.id,
       'Front Yard Pondless Waterfall — Design & Build',
       'pending',
       'Water Features',
       'Austin',
       current_date + 14,
       8500.00
from public.contacts c where c.email = 'dave.hernandez@example.com' limit 1;

insert into public.employees (name, phone, email, role, active)
values
  ('Austin Schiff', '(217) 503-0407', 'alpineoutdooragent@gmail.com', 'Owner', true)
on conflict do nothing;

insert into public.reviews (customer_name, service, quote, rating, review_date, source, published)
values
  ('Mike R.', 'Water Features', 'Austin built an incredible pondless waterfall in our backyard. The craftsmanship is outstanding — it looks completely natural. Highly recommend Alpine Outdoor Living.', 5, current_date - 30, 'Google', true),
  ('Jennifer S.', 'Patios', 'We had a large paver patio installed with a built-in fire pit. The attention to detail was amazing and the project was completed on time. Love spending evenings out there now.', 5, current_date - 14, 'Google', true),
  ('Tom & Karen B.', 'Fire Pits', 'Alpine transformed our boring backyard into an outdoor living space we use every weekend. The fire pit is the centerpiece — great design and solid build quality.', 5, current_date - 7, 'Facebook', true)
on conflict do nothing;
