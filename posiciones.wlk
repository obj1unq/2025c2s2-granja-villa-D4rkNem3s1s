import wollok.game.*

object norte {
  method siguiente(pos) = game.at(pos.x(), pos.y() + 1)
}

object sur {
  method siguiente(pos) = game.at(pos.x(), pos.y() - 1)
}

object este {
  method siguiente(pos) = game.at(pos.x() + 1, pos.y())
}

object oeste {
  method siguiente(pos) = game.at(pos.x() - 1, pos.y())
}

object noreste {
  method siguiente(pos) = game.at(pos.x() + 1, pos.y() + 1)
}

object noroeste {
  method siguiente(pos) = game.at(pos.x() - 1, pos.y() + 1)
}

object sureste {
  method siguiente(pos) = game.at(pos.x() + 1, pos.y() - 1)
}

object suroeste {
  method siguiente(pos) = game.at(pos.x() - 1, pos.y() - 1)
}