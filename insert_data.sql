-- =============================================================
-- INSERT statements for: Platforma na publikovani a sledovani
-- amaterských filmů
-- =============================================================
-- Execute in order (respects FK dependencies).
-- Assumes tables already created via generated.sql.
-- =============================================================

-- 1. OAUTH_KONFIGURACE (3 rows)
INSERT INTO oauth_konfigurace (id, logo_url, nazev, authorization_url, scopes, token_url, user_info_url, client_id, client_secret)
VALUES ('00b3f810-0000-7abc-8def-000000001998', 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg', 'Google', 'https://accounts.google.com/o/oauth2/v2/auth', 'openid profile', 'https://oauth2.googleapis.com/token', 'https://openidconnect.googleapis.com/v1/userinfo', 'client-id-1', 'secret-1');

INSERT INTO oauth_konfigurace (id, logo_url, nazev, authorization_url, scopes, token_url, user_info_url, client_id, client_secret)
VALUES ('0119e830-0000-7abc-8def-000000002008', 'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png', 'GitHub', 'https://github.com/login/oauth/authorize', 'read:user', 'https://github.com/login/oauth/access_token', 'https://api.github.com/user', 'client-id-2', 'secret-2');

INSERT INTO oauth_konfigurace (id, logo_url, nazev, authorization_url, scopes, token_url, user_info_url, client_id, client_secret)
VALUES ('014c2b90-0000-7abc-8def-000000002015', 'https://upload.wikimedia.org/wikipedia/en/9/98/Discord_logo.svg', 'Discord', 'https://discord.com/api/oauth2/authorize', 'identify email', 'https://discord.com/api/oauth2/token', 'https://discord.com/api/users/@me', 'client-id-3', 'secret-3');

-- 2. KANAL (3 rows)
INSERT INTO kanal (id, nazev, slug)
VALUES ('011409f0-0000-7abc-8def-000000002015', 'TagTram Studios', 'tagtram-studios');

INSERT INTO kanal (id, nazev, slug)
VALUES ('00f074d0-0000-7abc-8def-000000002012', 'A24 films', 'a24-films');

INSERT INTO kanal (id, nazev, slug)
VALUES ('00c0a310-0000-7abc-8def-000000001989', 'Televizní vysílání Malín', 'tv-malin');

-- 3. UZIVATEL (5 rows)
INSERT INTO uzivatel (id, jmeno, avatar_url, role, oauth_konfigurace_id)
VALUES ('02d98d5b-1880-7abc-8def-000000002069', 'Filip Filmíček', 'https://ui-avatars.com/api/?name=Filip+Filmicek', 'uzivatel', '00b3f810-0000-7abc-8def-000000001998');

INSERT INTO uzivatel (id, jmeno, avatar_url, role, oauth_konfigurace_id)
VALUES ('03459ebd-e000-7abc-8def-000000002084', 'Eas Anderson', 'https://ui-avatars.com/api/?name=Eas+Anderson', 'uzivatel', '00b3f810-0000-7abc-8def-000000001998');

INSERT INTO uzivatel (id, jmeno, avatar_url, role, oauth_konfigurace_id)
VALUES ('04cb2204-0000-7abc-8def-000000002137', 'Jirka Kosek', 'https://ui-avatars.com/api/?name=Jirka+Kosek', 'admin', '0119e830-0000-7abc-8def-000000002008');

INSERT INTO uzivatel (id, jmeno, avatar_url, role, oauth_konfigurace_id)
VALUES ('0e608a7c-6bff-7abc-8def-000000009999', 'Ing. Pavel Vedral', 'https://ui-avatars.com/api/?name=Pavel+Vedral', 'uzivatel', '0119e830-0000-7abc-8def-000000002008');

INSERT INTO uzivatel (id, jmeno, avatar_url, role, oauth_konfigurace_id)
VALUES ('00dc5895-bfff-7abc-8def-000000001999', 'Ing. Dušan Chlapek, Ph.D.', 'https://ui-avatars.com/api/?name=Dusan+Chlapek', 'uzivatel', '014c2b90-0000-7abc-8def-000000002015');

-- 4. CLENSTVI (3 rows)
INSERT INTO clenstvi (kanal_id, uzivatel_id, role)
VALUES ('011409f0-0000-7abc-8def-000000002015', '04cb2204-0000-7abc-8def-000000002137', 'admin');

INSERT INTO clenstvi (kanal_id, uzivatel_id, role)
VALUES ('00f074d0-0000-7abc-8def-000000002012', '0e608a7c-6bff-7abc-8def-000000009999', 'clen');

INSERT INTO clenstvi (kanal_id, uzivatel_id, role)
VALUES ('00c0a310-0000-7abc-8def-000000001989', '00dc5895-bfff-7abc-8def-000000001999', 'admin');

-- 5. VIDEO (3 rows)
INSERT INTO video (id, nazev, popis, datum_publikace, nahledovy_obrazek_url, manifest_url, kanal_id)
VALUES ('019159d0-0000-7abc-8def-000000002025', 'Krátkodobé řešení', 'Vždy si jděte za svými sny.', DATE '2025-06-15', 'https://picsum.photos/seed/kratkodobe/1280/720', 'https://dash.akamaized.net/akamai/bbb_30fps/bbb_30fps.mpd', '011409f0-0000-7abc-8def-000000002015');

INSERT INTO video (id, nazev, popis, datum_publikace, nahledovy_obrazek_url, manifest_url, kanal_id)
VALUES ('01947b10-0000-7abc-8def-000000002026', 'Drama', 'Je to lepší než Backrooms.', DATE '2026-01-10', 'https://picsum.photos/seed/drama/1280/720', 'https://media.axinom.com/clear/Manifest.mpd', '00f074d0-0000-7abc-8def-000000002012');

INSERT INTO video (id, nazev, popis, datum_publikace, nahledovy_obrazek_url, manifest_url, kanal_id)
VALUES ('019159d0-1111-7abc-8def-000000002025', 'Král Žito', 'Pohádka, trochu delší než je třeba.', DATE '2025-11-05', 'https://picsum.photos/seed/zito/1280/720', 'https://bitmovin-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd', '00c0a310-0000-7abc-8def-000000001989');

-- 6. HODNOCENI (5 rows)
INSERT INTO hodnoceni (uzivatel_id, video_id, komentar, pocet_hvezdicek, datum_publikace)
VALUES ('04cb2204-0000-7abc-8def-000000002137', '019159d0-0000-7abc-8def-000000002025', 'Technicky skvělé, XML validní.', 5, DATE '2025-06-16');

INSERT INTO hodnoceni (uzivatel_id, video_id, komentar, pocet_hvezdicek, datum_publikace)
VALUES ('00dc5895-bfff-7abc-8def-000000001999', '01947b10-0000-7abc-8def-000000002026', 'Chybí tomu jasná ontologie.', 2.5, DATE '2026-01-15');

INSERT INTO hodnoceni (uzivatel_id, video_id, komentar, pocet_hvezdicek, datum_publikace)
VALUES ('0e608a7c-6bff-7abc-8def-000000009999', '019159d0-1111-7abc-8def-000000002025', 'Jiří Brdečka uvařil.', 4, DATE '2025-11-10');

INSERT INTO hodnoceni (uzivatel_id, video_id, komentar, pocet_hvezdicek, datum_publikace)
VALUES ('02d98d5b-1880-7abc-8def-000000002069', '01947b10-0000-7abc-8def-000000002026', NULL, 5, DATE '2026-02-01');

INSERT INTO hodnoceni (uzivatel_id, video_id, komentar, pocet_hvezdicek, datum_publikace)
VALUES ('03459ebd-e000-7abc-8def-000000002084', '019159d0-0000-7abc-8def-000000002025', NULL, 4.5, DATE '2025-06-20');

-- 7. SLEDOVANI (5 rows)
-- Multiple watch heartbeats per user-video pair, each with unique id
INSERT INTO sledovani (video_id, uzivatel_id, id, cas_od, cas_do, session_id)
VALUES ('01947b10-0000-7abc-8def-000000002026', '02d98d5b-1880-7abc-8def-000000002069', 'a0000000-0000-7abc-8def-000000000001', 0, 7200, '00000000-0000-7abc-8def-000000000001');

INSERT INTO sledovani (video_id, uzivatel_id, id, cas_od, cas_do, session_id)
VALUES ('01947b10-0000-7abc-8def-000000002026', '03459ebd-e000-7abc-8def-000000002084', 'a0000000-0000-7abc-8def-000000000002', 120, 7200, '00000000-0000-7abc-8def-000000000002');

INSERT INTO sledovani (video_id, uzivatel_id, id, cas_od, cas_do, session_id)
VALUES ('019159d0-0000-7abc-8def-000000002025', '04cb2204-0000-7abc-8def-000000002137', 'a0000000-0000-7abc-8def-000000000003', 0, 1500, '00000000-0000-7abc-8def-000000000003');

INSERT INTO sledovani (video_id, uzivatel_id, id, cas_od, cas_do, session_id)
VALUES ('019159d0-1111-7abc-8def-000000002025', '0e608a7c-6bff-7abc-8def-000000009999', 'a0000000-0000-7abc-8def-000000000004', 0, 3600, '00000000-0000-7abc-8def-000000000004');

INSERT INTO sledovani (video_id, uzivatel_id, id, cas_od, cas_do, session_id)
VALUES ('019159d0-1111-7abc-8def-000000002025', '00dc5895-bfff-7abc-8def-000000001999', 'a0000000-0000-7abc-8def-000000000005', 0, 300, '00000000-0000-7abc-8def-000000000005');

COMMIT;
