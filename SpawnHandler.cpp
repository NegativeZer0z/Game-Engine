#include "SpawnHandler.h"

void SpawnHandler::onEvent(Event e) {
    if(e.getEventType() == "spawnEvent") {
        sp->spawn(player);
        view.setCenter(window->getSize().x / 2, window->getSize().y / 2);
        window->setView(view);
    }
}