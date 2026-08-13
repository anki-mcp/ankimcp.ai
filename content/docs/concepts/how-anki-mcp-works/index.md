---
title: "How Anki and AI Work Together Through AnkiMCP"
linkTitle: "Anki + MCP Together"
description: "AnkiMCP connects your AI assistant to Anki, so it can build and manage your cards and quiz you like a tutor. Here's how the two fit together."
keywords:
  - Anki AI integration
  - AnkiMCP
  - AI Anki cards
  - AI tutor Anki
  - automate Anki cards
  - Anki MCP server
  - active recall AI
  - spaced repetition AI
weight: 3
sitemap_priority: 0.8
---

**AnkiMCP connects your AI assistant to Anki. Once they're linked, the assistant can build and manage your cards for you, and it can quiz you like a tutor: it asks, you answer, and it corrects and explains.** Two old chores become one smooth loop.

This page explains how Anki and AI fit together through AnkiMCP. You need no technical background. We'll keep it conceptual here and focus on the ideas.

## What's the problem with making cards by hand?

Making good Anki cards is slow, and many people find it the worst part. Reviewing cards is fast; writing them is the slow, tiring part.

Andy Matuschak, who has written widely on spaced repetition, puts it plainly: "Writing good spaced repetition memory prompts is hard," and "it's quite time-consuming and cognitively taxing to do it."[\[1\]](#ref-1) One Hacker News reader said the same: "Reviewing them is quick, but it takes a lot of effort to craft good ones from a text."[\[2\]](#ref-2)

Medical students feel this hardest. In one forum thread, a student wrote that making cards "was 70-80% of the learning process," and called the chore "soul crushing."[\[3\]](#ref-3) On a popular Anki blog, readers report the same: "I'm spending too much time creating my flashcards," and "Making flashcards take me a really long time."[\[4\]](#ref-4) A well-known Reddit thread is titled, simply, "Making cards takes too much time, need some advice."[\[5\]](#ref-5)

## So should an AI just make all your cards?

Not necessarily — and many Anki users would say no. They believe that making cards is part of the learning, not a waste of time. They have a point, and it's worth respecting.

When you turn a textbook page into a card, you decide what matters and how to phrase it. That thinking helps you learn. So AnkiMCP isn't here to do your thinking for you.

Instead, it removes the **repetitive manual work**: the typing, the formatting, the deck sorting, the copy-and-paste. You still steer what goes on a card and why. The effort moves toward understanding, not toward formatting cards. That's the honest goal.

## What changes when the AI can reach Anki?

With AnkiMCP connected, your AI assistant can act inside Anki, not just talk about it. It builds and manages your decks on your behalf.

The open-source AnkiMCP server gives the assistant a set of tools for Anki.[\[6\]](#ref-6) Using them, it can:

- **Create cards**, one at a time or in batches, from text you paste or a topic you name.
- **Organize decks**: make new decks, move cards, add and rename tags.
- **Edit and clean up** existing cards, and fix or reword weak ones.
- **Read your stats**, so it can see what you study and how it's going.

You ask in plain language. The assistant does the clicking and typing. This is a mechanical description of how it works, not a promise about your test scores.

## What does the tutor loop look like?

Review stops being a one-way card flip and becomes a back-and-forth. The AI asks a question, you answer in your own words, and it responds.

Here's the loop:

1. The assistant pulls a due card and **asks you the question**.
2. You **answer in your own words**, out loud or by typing.
3. It **checks your answer**, corrects mistakes, and **explains** the right idea.
4. If a gap shows up, it can **make a new card** on the spot.

This pairs two ideas that research supports well. Let's look at each, without overclaiming.

### Why does answering out loud help?

Pulling an answer from memory beats just re-reading it. This is called retrieval practice, or active recall.

A large 2017 meta-analysis found that practice testing helped learning more than restudying, with a moderate average effect (Hedges g ≈ 0.51).[\[7\]](#ref-7) When you answer the AI's question before seeing the card, you're doing exactly that: retrieving, not re-reading.

### Why does a tutor add anything?

A tutor reacts to *your* answer, so the help fits what you got wrong. Learning with a tutor tends to beat studying alone.

VanLehn's 2011 review put the effect of human tutoring at about d ≈ 0.79, a large gain.[\[8\]](#ref-8) A broad 2020 meta-analysis of school tutoring programs found an average of about 0.37 standard deviations — a smaller but still solid gain.[\[9\]](#ref-9) Real effects vary, but the direction is steady: a responsive partner helps.

Feedback is part of why. A 2008 study found that adding feedback after a multiple-choice test raised correct answers and cut down wrong ones that students had picked.[\[10\]](#ref-10) Flipping a card already shows you the right answer. The tutor loop adds something extra: it reacts to *your* wording and explains *why*.

### Do AI tutors actually work?

The evidence here is early, so treat it with care. One 2025 randomized trial at Harvard tested a purpose-built AI tutor against a regular active-learning class.[\[11\]](#ref-11) Students using the AI tutor learned more in less time.

That's promising, but it's a single study, in one course, with about 180 students, using a carefully designed tutor. It is not settled science, and an AI tutor is not the same as a skilled human one.

## How does the add-on run inside Anki?

{{< callout type="info" >}}
**This section describes the AnkiMCP add-on** — the version you install inside Anki, which runs the server there. The separate AnkiMCP CLI server works differently and is documented on its own. Not sure which you use? See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).
{{< /callout >}}

<!-- TODO(cli-agent): Add the CLI's architecture alongside this section (a
     sibling H2, or tabs inside it), covering how the CLI process talks to
     Anki through AnkiConnect rather than running inside Anki, what that
     means for "Anki must be open", and the STDIO vs HTTP transports.
     Keep the same plain-English voice. Do not rewrite the add-on prose. -->

You don't need any of this to use AnkiMCP. It's here because "a program is changing my collection while I'm using it" is a fair thing to want explained.

**The short version: your AI's requests go through Anki itself, one at a time, landing in exactly the same place your own clicks do.** Nothing reaches around Anki to edit your collection behind its back.

Three things follow from that:

- **Anki has to be open.** The server lives inside Anki. Close Anki and the server goes with it.
- **Your decks, history and schedule stay consistent.** Every change runs through Anki's own code, so nothing gets corrupted and Anki's undo works normally.
- **The add-on inherits Anki's own rules** — including [not being able to edit a note you're viewing in Browse](/docs/how-to/troubleshooting/).

Curious how it's built? The internals are in the [add-on source](https://github.com/ankimcp/anki-mcp-server-addon).

For the exact list of operations the AI can request, see the [add-on tools reference](/docs/reference/addon/tools/).

## What this does and doesn't promise

Be realistic about the limits. The AI removes the busywork of building cards; it doesn't remove the thinking that makes cards stick.

It also doesn't shrink your daily **review** load. That's a different problem, set by Anki's schedule and your own deck. And the AI-tutor research is new and narrow, so the tutor loop is a reasonable choice, not a guarantee. You still sit down and review.

## Common questions

**Does the AI do my learning for me?**
No. It handles the typing, formatting, and sorting. You still decide what to study and answer the questions yourself. The thinking stays with you.

**Will this reduce how many cards I review each day?**
No. AnkiMCP changes how cards get *made* and *reviewed with you*, not how many are due. Anki's schedule still sets your daily count.

**Is the tutor loop proven to work better?**
Partly. Retrieval practice and tutoring both have strong research behind them.[\[7\]](#ref-7)[\[8\]](#ref-8)[\[9\]](#ref-9) AI tutors specifically have promising but early evidence, from few studies so far.[\[11\]](#ref-11)

**Do I still need to open Anki?**
Your cards live in your real Anki collection the whole time. The AI works with that collection, so your decks, history, and schedule stay intact.

Want to see it for yourself? The practical next step is to connect your AI assistant to Anki — the guide at [Connect Claude to Anki](/docs/how-to/connect-claude/) walks you through it.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*

## Sources and further reading

1. <a id="ref-1"></a>Andy Matuschak — *Writing good spaced repetition memory prompts is hard*: [notes.andymatuschak.org](https://notes.andymatuschak.org/Writing_good_spaced_repetition_memory_prompts_is_hard)
2. <a id="ref-2"></a>Hacker News, user kd5bjo — comment on crafting spaced-repetition prompts: [news.ycombinator.com/item?id=25600108](https://news.ycombinator.com/item?id=25600108)
3. <a id="ref-3"></a>Student Doctor Network forum — *Anki taking too long M2* (med-student thread on card-making time): [forums.studentdoctor.net](https://forums.studentdoctor.net/threads/anki-taking-too-long-m2.1152684/)
4. <a id="ref-4"></a>LeanAnki — *Using Anki Efficiently* (quotes readers on card-creation time): [leananki.com/using-anki-efficiently](https://leananki.com/using-anki-efficiently/)
5. <a id="ref-5"></a>Reddit, r/Anki — thread titled *"Making cards takes too much time, need some advice"*: [reddit.com](https://www.reddit.com/r/Anki/comments/r1bwsq/making_cards_takes_too_much_time_need_some_advice/)
6. <a id="ref-6"></a>AnkiMCP — Anki MCP server (open-source project): [github.com/ankimcp/anki-mcp-server](https://github.com/ankimcp/anki-mcp-server)
7. <a id="ref-7"></a>Adesope, Trevisan & Sundararajan (2017). *Rethinking the Use of Tests: A Meta-Analysis of Practice Testing*, *Review of Educational Research* (practice testing vs restudy, g ≈ 0.51): [journals.sagepub.com](https://journals.sagepub.com/doi/abs/10.3102/0034654316689306)
8. <a id="ref-8"></a>VanLehn (2011). *The Relative Effectiveness of Human Tutoring, Intelligent Tutoring Systems, and Other Tutoring Systems*, *Educational Psychologist* (human tutoring d ≈ 0.79): [tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/00461520.2011.611369)
9. <a id="ref-9"></a>Nickow, Oreopoulos & Quan (2020). *The Impressive Effects of Tutoring on PreK-12 Learning*, NBER Working Paper 27476 (pooled effect ≈ 0.37 SD): [nber.org/papers/w27476](https://www.nber.org/papers/w27476)
10. <a id="ref-10"></a>Butler & Roediger (2008). *Feedback enhances the positive effects and reduces the negative effects of multiple-choice testing*, *Memory & Cognition*: [pubmed.ncbi.nlm.nih.gov/18491500](https://pubmed.ncbi.nlm.nih.gov/18491500/)
11. <a id="ref-11"></a>Kestin et al. (2025). *AI tutoring outperforms in-class active learning: an RCT*, *Scientific Reports* (single, early study): [nature.com](https://www.nature.com/articles/s41598-025-97652-6)
