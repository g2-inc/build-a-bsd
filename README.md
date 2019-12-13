# Build A BSD

* License: 2-Clause BSD License
* Language: /bin/sh on HardenedBSD
* Status: No workie, yet

This collection of scripts provides automation for installing a
customized, templated BSD installation onto a physical medium. This
repo is meant to be ran from an mfsBSD-based solution, like SoloBSD.

While support for multiple BSDs is planned, only HardenedBSD is
supported at the moment.

Boot from an mfsBSD, download this repo, untar it, and run
`bin/bab.sh` as root.

## Design and Architecture

This project does not have a set design/architecture as of yet. As of
13 Dec 2019, the original author (Shawn Webb) is writing it out of
immediate necessity. A formal design and architecture will be decided
upon and documented at a later date.

## Roadmap

The first goal is to bootstrap an entire desktop system, optionally
joined to a Microsoft Active Directory domain.
