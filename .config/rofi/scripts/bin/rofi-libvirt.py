#!/usr/bin/env python3

from __future__ import print_function
import sys
import os
import libvirt
import subprocess

url = "qemu:///system"

ops = {
        "start": {
            "icon": "system-shutdown",
            "func": lambda dom: (
                dom.create()
                )
            },
        "shutdown": {
            "icon": "system-shutdown",
            "func": lambda dom: (
                dom.shutdown()
                )
            },
        "destroy": {
            "icon": "process-stop",
            "func": lambda dom: (
                dom.destroy()
                )
            },
        "pause": {
            "icon": "media-playback-pause",
            "func": lambda dom: (
                dom.suspend()
                )
            },
        "resume": {
            "icon": "media-playback-start",
            "func": lambda dom: (
                dom.resume()
                )
            },
        "wakeup": {
            "icon": "media-playback-start",
            "func": lambda dom: (
                dom.pMWakeup()
                )
            },
        "view": {
            "icon": "video-display",
            "func": lambda dom: (
                subprocess.Popen(["virt-viewer", "-c", url, dom.name()])
                )
            },
        "edit": {
            "icon": "emblem-system",
            "func": lambda dom: (
                subprocess.Popen(["virt-manager", "-c", url, "--show-domain-editor", dom.name()])
                )
            }
        }

states = {
        libvirt.VIR_DOMAIN_NOSTATE: {
            "text": "unknown",
            "icon": "dialog-question",
            "cmds": ["edit"]
            },
        libvirt.VIR_DOMAIN_RUNNING: {
            "text": "running",
            "icon": "media-playback-start",
            "cmds": ["shutdown", "destroy", "pause", "view", "edit"]
            },
        libvirt.VIR_DOMAIN_BLOCKED: {
            "text": "blocked",
            "icon": "dialog-warning",
            "cmds": ["shutdown", "destroy", "pause", "view", "edit"]
            },
        libvirt.VIR_DOMAIN_PAUSED: {
            "text": "paused",
            "icon": "media-playback-pause",
            "cmds": ["resume", "edit"]

            },
        libvirt.VIR_DOMAIN_SHUTDOWN: {
            "text": "shutting down",
            "icon": "system-run",
            "cmds": ["view", "edit"]
            },
        libvirt.VIR_DOMAIN_SHUTOFF: {
            "text": "shut off",
            "icon": "media-playback-stop",
            "cmds": ["start", "edit"]
            },
        libvirt.VIR_DOMAIN_CRASHED: {
            "text": "crashed",
            "icon": "software-update-urgent",
            "cmds": ["start", "edit"]
            },
        libvirt.VIR_DOMAIN_PMSUSPENDED: {
            "text": "PM suspended",
            "icon": "media-playback-pause",
            "cmds": ["wakeup", "edit"]
            }
        }

def virtConnect():
    try:
        conn = libvirt.open(url)
    except libvirt.libvirtError:
        print('No libvirt daemon found\0nonselectable\x1ftrue')

    if conn == None:
        print('No libvirt daemon found\0nonselectable\x1ftrue')
        exit(0)

    return conn


def getDomainsList(conn):
    domains = conn.listAllDomains(0)

    if len(domains) == 0:
        print('No VM found')
        exit(0)

    return domains


rofi_retv = int(os.getenv('ROFI_RETV'))
rofi_info = os.getenv('ROFI_INFO')

conn = virtConnect()
if rofi_retv == 0:

    domains = getDomainsList(conn)
    for dom in domains:
        name = dom.name()
        state, reason = dom.state()
        statestr = states[state]["text"]
        icon = states[state]["icon"]
        print("{0}\0meta\x1f{1}\x1finfo\x1fshow-ops\x1ficon\x1f{2}".format(name, statestr, icon))

elif rofi_retv == 1:

    if rofi_info == "show-ops":
        domname = sys.argv[1]
        print("\0prompt\x1f{}>".format(domname))
        dom = conn.lookupByName(domname)
        state, reason = dom.state()
        for op in states[state]["cmds"]:
            icon = ops[op]["icon"]
            print("{0}\0info\x1fexec-op {1}\x1ficon\x1f{2}".format(op, domname, icon))
    else:
        infolist = rofi_info.split(" ",1)
        if infolist[0] == "exec-op" and len(infolist) == 2:
            domname = infolist[1]
            op = sys.argv[1]
            dom = conn.lookupByName(domname)
            ops[op]["func"](dom)

conn.close()
