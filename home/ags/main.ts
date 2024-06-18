const hyprland = await Service.import("hyprland");
const notifications = await Service.import("notifications");
const mpris = await Service.import("mpris");
const audio = await Service.import("audio");

const date = Variable("", {
  poll: [1000, 'date "+%a, %e. %b | %k:%M"'],
});

const Workspaces = () =>
  Widget.Box({
    class_name: "workspaces",
    children: Array.apply(null, Array(5)).map((i, index) =>
      Widget.Button({
        attribute: index,
        vpack: "center",
        on_clicked: () =>
          hyprland.messageAsync(`dispatch workspace ${index + 1}`),
        setup: (self) =>
          self.hook(hyprland, () => {
            self.toggleClassName(
              "active",
              hyprland.active.workspace.id === index + 1
            );
            self.toggleClassName(
              "occupied",
              (hyprland.getWorkspace(index + 1)?.windows || 0) > 0
            );
          }),
      })
    ),
  });

function Media() {
    const label = Utils.watch("", mpris, "player-changed", () => {
        if (mpris.players[0]) {
            const { track_artists, track_title } = mpris.players[0]
            return `${track_artists.join(", ")} ${track_title && "-"} ${track_title}`
        } else {
            return "Nothing is playing"
        }
    })

    return Widget.Button({
        class_name: "media",
        on_primary_click: () => mpris.getPlayer("")?.playPause(),
        on_scroll_up: () => mpris.getPlayer("")?.next(),
        on_scroll_down: () => mpris.getPlayer("")?.previous(),
        child: Widget.Label({ label }),
    })
}


function Volume() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const icon = Widget.Icon({
        css: 'margin-left: 5px',
        icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    })

    const label = Utils.watch("", audio, "speaker-changed", () => `${Math.round(audio.speaker.volume*100)}%`)

    return Widget.EventBox({
        class_name: "volume",
        onScrollUp: () => {if(audio.speaker.volume < 0.96) audio.speaker.volume = audio.speaker.volume + 0.05},
        onScrollDown: ()=> audio.speaker.volume=audio.speaker.volume - 0.05,
        onPrimaryClick: ()=> audio.speaker.is_muted = !audio.speaker.is_muted,
        child: Widget.Box({
          children: [Widget.Label({ label, css: audio.speaker.bind("is_muted").as(m=> m ? "opacity: 0.3" : "opacity: 1")}), icon],
        })
    })
}

function Clock() {
  return Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });
}

function Notification() {
  const popups = notifications.bind("popups");
  return Widget.Box({
    class_name: "notification",
    visible: popups.as((p) => p.length > 0),
    children: [
      Widget.Icon({
        icon: "preferences-system-notifications-symbolic",
      }),
      Widget.Label({
        label: popups.as((p) => p[0]?.summary || ""),
      }),
    ],
  });
}

// layout of the bar
function Left() {
  return Widget.Box({
    spacing: 8,
    children: [Media()],
  });
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [Workspaces()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Volume(), Clock()],
  });
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
}

Utils.monitorFile(
    `${App.configDir}/../../.cache/ags/color.css`,
  function() {
    App.resetCss()
    App.applyCss(`${App.configDir}/style.css`)
  },
);
App.config({
  style: "./style.css",
  windows: [Bar()],
});

export {};
