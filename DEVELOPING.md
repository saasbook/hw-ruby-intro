# Developing Your Assignment

<!--
  Shared student-facing doc for ESaaS CHIPs. This file lives at
  common/docs/DEVELOPING.md in the chips monorepo and is copied into each
  participating chip's generated starter repo as DEVELOPING.md.
  Keep it generic: it must make sense for any chip that ships it.
-->

There are four supported ways to set up a development environment for this
assignment. They all end up in the same place — a shell where you can edit the
assignment files and run the tools the assignment calls for — so pick the one
that best fits your situation:

| Method | Choose it if... |
|--------|-----------------|
| [Local development](#local-development) | You are comfortable installing Ruby and command-line tools on your own machine |
| [Local development with Docker](#local-development-with-docker) | You want a ready-made, consistent environment but still want to work on your own machine |
| [Codio](#codio) | Your course uses Codio — everything is preinstalled for you |
| [GitHub Codespaces](#github-codespaces) | You want a zero-install environment in the browser (or in VS Code), hosted by GitHub |

Whichever method you choose, your workflow is the same: edit the assignment
files, run the tests or tools the assignment describes, and commit and push
your work regularly.

If this assignment ships with a `run_specs.sh` helper, you can run
`bash run_specs.sh` from the assignment's root directory to get an interactive
menu for running the test suite one part at a time.

## GitHub SSH keys

If you clone or push using an SSH URL such as
`git@github.com:OWNER/REPOSITORY.git`, set up an SSH key in the environment
where you run Git:

1. Follow GitHub's instructions to
   [generate an SSH key and add it to the SSH agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
2. [Add the public key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
   Keep the private key private.
3. [Test your SSH connection](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection):

   ```sh
   ssh -T git@github.com
   ```

HTTPS clone URLs do not use SSH keys. GitHub Codespaces already authenticates
Git operations for the repository you opened.

## Local Development

Work directly on your own machine. You are responsible for installing the
right versions of the tools:

1. Install the version of Ruby listed in this repo's `.ruby-version` file,
   using a Ruby version manager such as [rvm](https://rvm.io),
   [rbenv](https://github.com/rbenv/rbenv), or [asdf](https://asdf-vm.com).
2. If the repo contains a `Gemfile`, install the gems it lists:

   ```sh
   gem install bundler
   bundle install
   ```

3. Run the test suite with `bundle exec rspec` (or `bash run_specs.sh` for an
   interactive menu), and individual spec files with, e.g.,
   `bundle exec rspec spec/part1_spec.rb`.

Some assignments also rely on common command-line utilities (for example,
`curl` and `nc` for the HTTP assignment). These are preinstalled on most
macOS and Linux systems; on Windows we strongly recommend using
[WSL2](https://learn.microsoft.com/en-us/windows/wsl/) — or one of the Docker,
Codio, or Codespaces options below — rather than trying to run the tools
natively.

## Local Development with Docker

The repo includes a `Dockerfile` that builds a container image with all of the
assignment's tools preinstalled, so the environment is identical no matter
what platform you run on (Windows/macOS/Linux).

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
   (or Docker Engine on Linux) and make sure it is running.
2. From the root directory of your clone of the repo, build the image (note
   the trailing `.`, and feel free to substitute your own image name):

   ```sh
   docker build -t esaas-chip .
   ```

3. Run a container from the image, mounting your working copy into it so that
   edits you make on your machine are immediately visible inside the
   container — no rebuild needed:

   ```sh
   docker run -it --rm -v "$(pwd)":/app --name esaas-chip esaas-chip
   ```

   Depending on the assignment, this either drops you into a shell or starts
   the interactive test-runner menu. Edit files with your favorite editor on
   your own machine; run tests and other commands inside the container.

4. If the assignment needs more than one shell at once (for example, one
   window running a server and another running a client), open a second
   terminal into the *same running container*:

   ```sh
   docker exec -it esaas-chip bash
   ```

The Docker workflow for these assignments is adapted from the
[NYU CSE Software Engineering version of hw-ruby-intro](https://github.com/NYU-CSE-Software-Engineering/hw-ruby-intro).

## Codio

If your course is set up on [Codio](https://codio.com), the assignment is
available there as a preconfigured workspace: open the assignment from your
Codio course page and everything (Ruby, gems, command-line tools) is already
installed.

* The panel on the right shows the assignment instructions ("guides"); the
  file tree and editor are on the left, and you can open a terminal via
  **Tools → Terminal**.
* Your work is saved in the Codio workspace itself; follow your course's
  instructions for how (and whether) to also push it to GitHub.
* If the assignment has a "Submit & Grade" button in the guides, use it to
  submit; otherwise follow the submission instructions in the assignment.

## GitHub Codespaces

[GitHub Codespaces](https://docs.github.com/en/codespaces) gives you a
cloud-hosted VS Code environment built from this repo's
`.devcontainer/devcontainer.json`, which in turn builds the same `Dockerfile`
used for local Docker development — no local installs at all.

1. Navigate to *your copy* of the assignment repo on GitHub (per the
   assignment instructions: fork the repo or create your own repo from the
   template first — don't work directly on the class copy).
2. Click the green **Code** button, choose the **Codespaces** tab, and click
   **Create codespace on main**. The first launch builds the container image,
   which can take a couple of minutes.
3. When the editor opens, use the built-in terminal (**Terminal → New
   Terminal**) to run tests and other commands, exactly as in the local
   setups above. You can open as many terminals as you need — they all share
   the same container.
4. Commit and push from inside the codespace as you normally would; the
   codespace is already authenticated to your GitHub account.

A few tips:

* GitHub's free plan includes a monthly quota of Codespaces hours —
  [stop or delete](https://docs.github.com/en/codespaces/developing-in-a-codespace/stopping-and-starting-a-codespace)
  codespaces you are not using.
* Codespaces auto-save your files, but **only commits that you push ever leave
  the codespace** — push early and often.
* You can also open a codespace in your locally installed VS Code (rather than
  the browser) via the [GitHub Codespaces extension](https://marketplace.visualstudio.com/items?itemName=GitHub.codespaces).
