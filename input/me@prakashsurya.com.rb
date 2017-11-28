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
fs = GmailBritta.filterset(:me => ['me@prakashsurya.com']) do
    filter {
        has [{:or => %w{
            from:aws-receivables-support@email.amazon.com
            from:fidelity.investments@mail.fidelity.com
            from:uber.us@uber.com
            from:verve@vervecoffee.com
            replyto:billpay.reply@billpay.bankofamerica.com
            replyto:no-reply@amazon.com
            replyto:provisionspest@gmail.com
        }}]
        archive
    }

    filter {
        has [{:or => %w{
            from:*@allstatesurvey.com
            from:*@marketplace.amazon.com
            from:a098513@allstate.com
            from:admin@woodworkingmasterclasses.com
            from:andrewfinneyteam@gmail.com
            from:change@mail.change.org
            from:customer-reviews-messages@amazon.com
            from:customercare@wateremail.com
            from:customersupport@audible.com
            from:email@et.uber.com
            from:las_vegas_do_not_reply@cox.com
            from:mail@lv51.com
            from:newsletters@audible.com
            from:no-reply@uber.com
            from:noreply@emails.goaaa.com
            from:reminders@ftdreminders.com
            from:reply@emails.goaaa.com
            from:roku@email.roku.com
            from:store-news@amazon.com
            from:support@connect.vizio.com
            from:customersupport@vizio.com
        }}]
        delete_it
    }

    filter {
        has [{:or => %w{
            replyto:a098513@allstate.com
            replyto:andrewf@bhhsnv.com
            replyto:andrewfinneyteam@gmail.com
            replyto:b2contact@backblaze.com
            replyto:customer.service@ifly.alaskaair.com
            replyto:customercare@eyesonwalls.com
            replyto:customersupport@realtor.com
            replyto:estatements@safecu.org
            replyto:help@superbmaids.net
            replyto:homealert@realtor.com
            replyto:jimmyvega@allstate.com
            replyto:lora@lorazombie.com
            replyto:media@eat24.com
            replyto:news@asana.com
            replyto:newsletter@haleystrategic.com
            replyto:no-reply@lucidchart.com
            replyto:no-reply@mint.com
            replyto:no-reply@venmo.com
            replyto:noreply@eosfitness.com
            replyto:noreply@lucidpress.com
            replyto:pbsupdates@pbs.org
            replyto:replies@la-z-boy.com
            replyto:reply@adorama.com
            replyto:reply@a.eat24.com
            replyto:subscriptions@service.economist.com
            replyto:upgrades@virginamerica.com
            replyto:vizio@crowdtwist.com
        }}]
        delete_it
    }

end

puts fs.generate

# vim: tabstop=4 shiftwidth=4 expandtab textwidth=72 colorcolumn=80
