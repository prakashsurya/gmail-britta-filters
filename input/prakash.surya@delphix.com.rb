#!/usr/bin/env ruby

require 'rubygems'
require 'gmail-britta'

#
# Here are some things to note when performing filter-fu with gmail:
#
#  - A filter condition tops out at 1500 chars, apparently. This fits
#    a decent amount of conditions, but something to be careful about.
#    There is no check in gmail-britta against this, but Gmail will
#    refuse to import (or drop) filters that violate this.
#
#  - If you use archive_unless_directed heavily, you almost certainly
#    want to check the "Don't override filters" box in Gmail's Inbox
#    preferences.
#
fs = GmailBritta.filterset(:me => ['prakash.surya@delphix.com']) do
    filter {
        has [{:or => %w{
            cc:developer@lists.illumos.org
            to:developer@lists.illumos.org
        }}]
        label 'ml-illumos-developer'
        mark_read
    }.archive_unless_directed

    filter {
        has [{:or => %w{
            cc:zfs@lists.illumos.org
            to:zfs@lists.illumos.org
        }}]
        label 'ml-zfs-developer'
        mark_read
    }.archive_unless_directed

    filter {
        has [{:or => %w{
            cc:oi-dev@openindiana.org
            to:oi-dev@openindiana.org
        }}]
        label 'ml-oi-developer'
        mark_read
    }.archive_unless_directed

    filter {
        has [{:or => %w{
            cc:omnios-discuss@lists.omniti.com
            to:omnios-discuss@lists.omniti.com
        }}]
        label 'ml-omnios-discuss'
        mark_read
    }.archive_unless_directed

    filter {
        has [{:or => %w{
            cc:developer@open-zfs.org
            to:developer@open-zfs.org
        }}]
        label 'ml-developer'
        mark_read
    }.archive_unless_directed

    filter {
        has [{:or => %w{
            to:git-notify-app@delphix.com
            to:git-notify-devops@delphix.com
            to:git-notify-os@delphix.com
            from:jenkins@delphix.com
        }}]
        delete_it
    }
end

puts fs.generate

# vim: tabstop=4 shiftwidth=4 expandtab textwidth=72 colorcolumn=80
