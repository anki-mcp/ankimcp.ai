# STYLE.md — AnkiMCP Tutorial & Explainer Writing Spec

**Bottom line:** Following this spec consistently will produce short, clear, engaging, SEO-friendly tutorial articles that non-native English speakers can read fast — directly fixing the "too long, boring, too complicated" problem. The single test that overrides everything: *if a reader would want to ask an AI to summarize the article, it failed.*

This file is a loadable spec. Save it as `STYLE.md` (or a writing skill) and hand it to Claude Code before it writes any AnkiMCP article.

**Purpose:** Rules for writing every AnkiMCP tutorial/explainer article (ankimcp.ai).

**Audience:** Non-technical Anki users — medical students, language learners, scientists, and students who use spaced repetition heavily. Many are non-native English speakers (target CEFR B1 / intermediate). Some are technically literate (the open-source `anki-mcp-server` crowd). Respect their intelligence. Be easy, not dumbed-down.

**Product facts to keep correct:** AnkiMCP connects Anki to AI assistants (Claude, ChatGPT) via the Model Context Protocol (MCP). Freemium: **$5/month or $50/year**. The paid managed-tunnel service means users skip manual technical setup (no running ngrok themselves).

---

## TL;DR — the 8 rules that matter most

1. **Put the answer first.** Inverted pyramid / BLUF. The first sentence states the outcome.
2. **Average 15–20 words per sentence.** One idea per sentence.
3. **Target reading grade 6–8** (Flesch Reading Ease 60–70).
4. **Article length 500–900 words** for a how-to; 800–1,200 for an explainer. If longer, split it.
5. **Write for scanning:** an H2 every ~150 words, short paragraphs (2–4 sentences), bold keywords, lists.
6. **Use "you" and active voice.** Imperative for steps ("Open Anki").
7. **Plain words only.** No idioms, no phrasal-verb soup, no jargon without a one-line definition.
8. **Cut fluff.** Delete throat-clearing intros, hedging, and filler.

---

## 1. Length & readability targets (hard numbers)

| Metric | Target | Source / reason |
|---|---|---|
| Average sentence length | **15–20 words** | Martin Cutts, *Oxford Guide to Plain English* (5th ed.), Guideline 3: "Over the whole document, make the average sentence length 15–20 words." The EU Commission's *How to write clearly* gives the same target: "1 sentence = 20 words on average (but sprinkle in a few short sentences!)" |
| Max sentence length | **~25 words**; rare exceptions | Readability tables (US press-association data, cited in Jyoti Sanyal's *Indlish*) rate sentences "17 words standard; 21 words fairly difficult; 25 words difficult; 29 words or more, very difficult." |
| Paragraph length | **2–4 sentences (40–80 words)** | Web readers skim; walls of text get skipped. |
| Reading grade | **Grade 6–8** (Flesch Reading Ease 60–70) | The average American reads at a 7th–8th-grade level (OECD PIAAC); the AMA/NIH/CDC recommend public health/medical info "at no higher than an eighth-grade reading level." |
| How-to article length | **500–900 words** | Long enough to finish the task, short enough to keep attention. |
| Explainer article length | **800–1,200 words** | Cap it; link out instead of padding. |
| Line length (CSS — note for site owners) | ~80 characters max | Accessibility (WCAG 1.4.8). |
| Headings | One **H2 every ~150 words** | People scan headings first. |

**Why these numbers:** Nielsen Norman Group eye-tracking shows users read in an **F-pattern** and skim rather than read. Per NN/g's "How Little Do Users Read?" (Jakob Nielsen, March 2008, based on Weinreich et al.'s ~45,000-pageview study): "On the average Web page, users have time to read at most 28% of the words during an average visit; 20% is more likely." So front-load meaning into the first words of every heading, paragraph, and sentence.

**Self-check:** Paste the draft into Hemingway Editor. Fix anything flagged "very hard to read." Aim for grade 6–9.

---

## 2. Article structure (templates)

Use the **inverted pyramid** (a.k.a. BLUF, "bottom line up front"): most important info first, details after. A reader who stops halfway should still succeed.

### How-to / tutorial skeleton

```markdown
# [Outcome-focused H1 with keyword] — e.g. "Create Anki Cards with Claude in 5 Minutes"

> One-sentence summary of what the reader will achieve. (This is the BLUF.)

**What you need:** 2–4 bullets (Anki installed, AnkiMCP account, Claude/ChatGPT).
**Time:** ~X minutes.

## What is [thing]? (2–3 sentences, only if needed)
Plain definition + why the reader cares. Link out for depth.

## Step 1: [Verb + object]
One action. Screenshot or code block. Expected result in one line.

## Step 2: [Verb + object]
...

## Step 3: [Verb + object]
...

## Check it worked
What success looks like. One sentence.

## Fix common problems (mini-FAQ)
**Q: [exact error/question]?** One-paragraph answer.

## Next steps
2–3 links to related tutorials.
```

### Explainer skeleton

```markdown
# [Question or concept as H1] — e.g. "What is MCP, and Why Does Anki Need It?"

> One-sentence direct answer. (Featured-snippet / AI-citation bait.)

## The short version
3–4 sentence summary anyone can grasp.

## [Concept] explained with an analogy
Concrete analogy (see §6).

## Why it matters for your flashcards
Tie back to the reader's real goal: studying.

## How AnkiMCP uses it
Product tie-in, no hard sell.

## FAQ
2–4 real questions, one direct answer each.
```

**Rules for structure:**
- The first paragraph must answer "what is this and what will I get?" Never open with history, background, or "In today's fast-paced world."
- One H1 only. Use H2 for sections, H3 for sub-steps. Sentence-case headings.
- Number sequential steps. Don't number things that aren't sequential.
- Keep explanation OUT of tutorials (see §3).

---

## 3. Diátaxis — know which type you're writing

Four doc types, four jobs (Diátaxis framework by Daniele Procida; adopted by Cloudflare, Gatsby, and Canonical):

- **Tutorial** — learning by doing. Beginner. "Let's create your first AI-generated deck."
- **How-to guide** — solve one task. Assumes some competence. "How to connect ChatGPT to Anki."
- **Explanation** — understanding. "Why spaced repetition works."
- **Reference** — facts to look up. "AnkiMCP permission settings."

**Do not mix them.** The #1 cause of bloated, boring docs is stuffing reference and explanation into a tutorial. If you're writing steps and you start explaining *why* MCP was invented, stop and link out. Diátaxis on tutorials: give "the most minimal explanation" and link to depth "for when the user is ready for it."

---

## 4. Plain language & vocabulary (for non-native B1 readers)

**Core principles** (plainlanguage.gov / US Federal Plain Language Guidelines, CDC, Microsoft Writing Style Guide):

- **Active voice.** "Claude creates the card," not "The card is created by Claude."
- **Second person: "you."** Imperative for steps: "Click Save."
- **One idea per sentence. One topic per paragraph** (PLAIN: limit paragraphs to one topic and ~5 sentences max).
- **Define any technical term on first use,** in one short clause.
- **Use the same word for the same thing every time.** Don't show off with synonyms (Microsoft: "use one word for a concept, and use it consistently").
- **Use contractions** (it's, you'll, you're). They read as friendly and natural.
- **Keep "that," "who," and articles** ("the," "a"). Microsoft's global-writing guidance: they help non-native readers and translation tools parse sentences.

**Avoid (hard for non-native readers):**
- **Idioms & metaphors:** "piece of cake," "hit the ground running," "under the hood" → say it plainly. (Microsoft and the EU Commission both warn idioms confuse non-native readers and resist translation.)
- **Phrasal verbs** where a single verb exists: "fill out" → "complete"; "find out" → "discover"; "carry out" → "do." Phrasal verbs confuse learners because the meaning isn't the sum of the words (Edmond Weiss, *The Elements of International English Style*). When a phrasal verb is the natural product term (e.g., "set up"), keep it but use it consistently.
- **Long Latinate words** when a short Saxon word works (Fowler's rule: "Prefer the short word to the long").
- **Modifier stacks:** "the well-thought-out cloud-based sync configuration process" → break it up.
- **Hidden verbs (nominalizations):** "make an application" → "apply"; "provide assistance" → "help."

**Word swaps (use the right column):**

| Avoid | Use |
|---|---|
| utilize | use |
| in order to | to |
| due to the fact that | because |
| at this point in time | now |
| in the event that | if |
| commence / initiate | start |
| terminate | end / stop |
| facilitate | help |
| sufficient | enough |
| additional | more |
| approximately | about |
| demonstrate | show |
| numerous | many |
| obtain | get |
| prior to | before |
| subsequently | then / later |
| leverage (verb) | use |
| ensure | make sure |

---

## 5. Conciseness — cut the fluff

**Delete on sight** (filler / throat-clearing):
- "It's important to note that…", "It's worth mentioning…", "Needless to say…"
- "In today's world / fast-paced world…", "As we all know…"
- "Basically," "actually," "really," "very," "just," "quite," "simply" (when not literal)
- "I think / we believe" (state the fact)
- Redundant pairs: "each and every," "first and foremost," "end result," "free gift"
- Empty openers: "There is / There are…" → start with the subject

**Tighten constructions:**
- Passive → active. ("The deck was created by the AI" → "The AI created the deck.")
- "in a careful way" → "carefully"
- Remove signposting overload ("Furthermore," "Moreover" in every paragraph)

**Before / after examples:**

> **Before:** "In order to get started with the process of creating your very first flashcard, the first thing that you will need to do is to make sure that Anki is actually running on your computer." (33 words)
> **After:** "First, open Anki on your computer." (6 words)

> **Before:** "It's important to note that AnkiMCP utilizes the Model Context Protocol in order to facilitate communication between your AI assistant and the Anki application." (23 words)
> **After:** "AnkiMCP uses the Model Context Protocol (MCP) to connect your AI assistant to Anki." (13 words)

> **Before:** "There are a number of different ways in which you can go about reviewing your cards." (15 words)
> **After:** "You can review your cards in several ways." (8 words)

**The cut test:** Read each sentence. If removing a word doesn't change the meaning, delete it. If a paragraph doesn't help the reader finish the task, cut it.

---

## 6. Tone — easy but not boring

**Voice:** Warm, clear, helpful — like a smart friend who respects your time. (Microsoft brand voice: "warm and relaxed, crisp and clear, ready to lend a hand"; "we write for scanning first, reading second.")

**Keep it engaging without padding:**
- **Concrete over abstract.** Show a real prompt: *"Help me review my Spanish deck."* Don't describe it in the abstract.
- **Analogies for hard concepts.** Example: "MCP is like a USB-C port — one standard plug that lets any AI assistant talk to Anki." Use one analogy per concept, keep it simple, and don't switch analogies midway.
- **Speak to the reader's real goal:** passing the exam, learning the language — not "leveraging AI synergies."
- **Vary rhythm.** Mix short punchy sentences with medium ones. A 3-word sentence after a 20-word one creates emphasis.
- **Light personality is fine** — a small aside, a touch of warmth. Never sarcasm, never jokes that rely on idioms or culture.
- **Don't condescend.** Avoid "simply," "just," "obviously," "everyone knows" — they make stuck readers feel dumb.

**Don't:** robotic formality, hype ("revolutionary," "game-changing"), fake urgency, or marketing spin.

---

## 7. SEO & AEO checklist (for Markdown tutorials)

Optimize for both Google and AI answer engines (AI Overviews, ChatGPT, Perplexity). Google's official position: optimizing for AI search "is optimizing for the search experience, and thus still SEO" — there's no special trick, and there's "no special schema.org markup you need to add."

**On-page basics:**
- [ ] **One H1** containing the primary keyword, phrased as the outcome or question.
- [ ] **Title tag** ~50–60 chars; **meta description** ~150 chars that states the benefit.
- [ ] Logical heading hierarchy: H1 → H2 → H3, no skipped levels.
- [ ] **Primary keyword in the first 1–2 sentences,** the H1, and at least one H2. Match search intent ("how to," "what is").
- [ ] **Include the current year** in the title/intro for time-sensitive how-tos (LLMs favor fresh content).
- [ ] Descriptive link text (never "click here"). Internal-link to 2–3 related AnkiMCP articles.
- [ ] Descriptive alt text on every screenshot.
- [ ] Short, keyword-relevant URL slug.

**AEO / answer-engine optimization (what gets you cited):**
- [ ] **One question per H2, answered directly in the first 1–2 sentences below it** (chunking — LLMs cite self-contained answer blocks).
- [ ] Put a **40–60 word direct-answer summary** right under the H1 (featured-snippet + AI-citation bait).
- [ ] **FAQ section** with real questions and one direct answer each.
- [ ] Use **numbered steps and lists** — structured/list content is cited far more often by AI engines than prose.
- [ ] State facts cleanly and consistently (pricing $5/mo or $50/yr; what MCP is) so engines treat them as reliable. Consistency across pages builds the "consensus" AI engines look for before citing.

**Outdated — don't waste effort:**
- **HowTo schema:** Google Search Central (Aug 2023): "As of September 13[, 2023], Google Search no longer shows How-to rich results on desktop, which means this result type is now deprecated."
- **FAQ rich results:** restricted to authoritative government/health sites in 2023, then fully retired — Google Search Central: "As of May 7, 2026, FAQ rich results are no longer appearing in Google Search." You may still add `FAQPage` JSON-LD for machine readability, but don't expect SERP dropdowns.
- Keyword stuffing and exact-match repetition.

---

## 8. Formatting rules (Markdown)

- Sentence-case headings. No end punctuation on headings.
- Bold the **key term or action**, not whole sentences.
- Numbered lists for steps; bullets for non-sequential items.
- Fenced code blocks with a language tag for any command/config.
- One screenshot per major step where it helps; never decorative images.
- Tables only for real tabular data, not as a layout trick.
- Add a short intro line (1–2 sentences) before each list or subheading; don't stack headings back-to-back.

---

## 9. Pre-publish editing checklist (run every time)

- [ ] **Does the first sentence state the outcome?** (BLUF)
- [ ] **Could a busy reader skim only the headings and bold text and still succeed?**
- [ ] Every sentence ≤ ~25 words; average 15–20. Read it aloud — split any sentence you run out of breath on.
- [ ] Hemingway grade 6–9; nothing flagged "very hard."
- [ ] One idea per sentence; one topic per paragraph; paragraphs ≤ 4 sentences.
- [ ] Active voice and "you" throughout. Steps use imperatives.
- [ ] All idioms, phrasal-verb soup, and undefined jargon removed or defined.
- [ ] Filler words and throat-clearing intro cut.
- [ ] Word count within target (how-to 500–900; explainer 800–1,200). If over, cut or split.
- [ ] Tutorial contains steps, not essays — explanation linked out (Diátaxis).
- [ ] SEO/AEO checklist (§7) complete.
- [ ] Pricing and product facts correct and consistent ($5/month, $50/year; managed tunnel = no manual ngrok setup).
- [ ] Read it once as the reader: would you ask for a summary? If yes, cut more.

---

## 10. Quick reference card

- **Answer first. Scan-friendly. Plain words. Cut fluff.**
- Sentence 15–20 words · Paragraph 2–4 sentences · Grade 6–8 · How-to 500–900 words.
- "You" + active voice + imperative steps.
- One H2 per ~150 words; one question per H2, answered immediately.
- No idioms, no hype, no walls of text, no essays inside tutorials.
- **Final test: if you'd want a summary of it, it's too long.**

---

### Sources behind the major rules
Plain language & sentence length: plainlanguage.gov (US Federal Plain Language Guidelines), CDC plain-language resources, Martin Cutts' *Oxford Guide to Plain English* (15–20 words), European Commission *How to write clearly* (20 words avg). Readability targets: Flesch–Kincaid grade level; OECD PIAAC adult literacy (7th–8th grade average); AMA/NIH/CDC eighth-grade health-content norm. Web scanning & structure: Nielsen Norman Group (F-pattern; "How Little Do Users Read?", Nielsen 2008, 20–28%; inverted pyramid). Doc types: Diátaxis (Daniele Procida). Voice & global writing: Microsoft Writing Style Guide; Google developer documentation style guide. Conciseness: Purdue OWL, UNC Writing Center. Non-native readers: Edmond Weiss, *The Elements of International English Style*. SEO/AEO: Google Search Central (AI-optimization guide; HowTo deprecation Sept 2023; FAQ rich-result retirement May 2026).