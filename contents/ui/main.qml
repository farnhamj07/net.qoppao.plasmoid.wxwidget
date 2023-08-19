import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
Item {
	id: main
    property var radarRefreshInterval : plasmoid.configuration.radarRefreshInterval
    property var nwsAFD_URI : "https://forecast.weather.gov/product.php?site=NWS&issuedby=BGM&product=AFD&format=CI&version=1&glossary=1&highlight=off"
    /*	Plasmoid.compactRepresentation: Item {
		id: panelView
	}
	*/


    
	Plasmoid.fullRepresentation: Item {
		id: popupView
		Layout.minimumWidth: mapContainer.implicitWidth
        Layout.minimumHeight: mapContainer.implicitHeight
        Layout.preferredWidth: 600 * PlasmaCore.Units.devicePixelRatio
        Layout.preferredHeight: 550 * PlasmaCore.Units.devicePixelRatio
        function updateRadarMap() {
                radar_map.source = "https://localhost/weewx/weekbarometer.png"
         }
        TabView {
            Tab {
                title: "Red"
                         
        PlasmaComponents.Label {
            id: mapContainer
            //anchors.fill: parent
            width: 600
            height: 550
            Timer {
                interval: radarRefreshInterval
//                interval: 2000
                repeat:true
                running:true
                //onTriggered: radar_map.source = "https://radar.weather.gov/ridge/standard/KBGM_loop.gif"
                onTriggered: updateRadarMap()
            } 
            AnimatedImage {
                  id: "radar_map"
                    source: "https://radar.weather.gov/ridge/standard/KBGM_loop.gif"
            } 

        } 
        
        
        
        
        
        
            }
            Tab {
                title: "Blue"
                Rectangle { color: "blue" }
            }
            Tab {
                title: "Green"
                Rectangle { color: "green" }
            }
        }         


	} 
    
}

