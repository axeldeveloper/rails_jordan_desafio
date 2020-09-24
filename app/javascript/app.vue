<template>
  <div class="page-container">
    <md-app>
        <md-app-toolbar class="md-primary" md-elevation="0">
            <md-button class="md-icon-button" @click="toggleMenu" v-if="!menuVisible">
            <md-icon>menu</md-icon>
            </md-button>
            <span class="md-title">{{message}}</span>
        </md-app-toolbar>

        <md-app-drawer :md-active.sync="menuVisible" md-persistent="mini">
            <md-toolbar class="md-transparent" md-elevation="0">
                <span> <md-icon>menu</md-icon> MENU </span>

                <div class="md-toolbar-section-end">
                    <md-button class="md-icon-button md-dense" @click="toggleMenu">
                    <md-icon>keyboard_arrow_left</md-icon>
                    </md-button>
                </div>
            </md-toolbar>

            <md-list>
                <md-list-item to="/">
                    <md-icon>home</md-icon>
                    <span class="md-list-item-text">Home</span>
                </md-list-item>

                <md-list-item to="/Search">
                    <md-icon>search</md-icon>
                    <span class="md-list-item-text">Search</span>
                </md-list-item>

                <md-list-item to="/Status" exact>
                    <md-icon>donut_small</md-icon>
                    <span class="md-list-item-text">Status</span>
                </md-list-item>

                <md-list-item to="http://localhost:3000/admin" exact>
                    <md-icon>table_view</md-icon>
                    <span class="md-list-item-text">Admin</span>
                </md-list-item>
            
            </md-list>
        </md-app-drawer>

        <md-app-content>
            <router-view></router-view>
        </md-app-content>
    </md-app>
  </div>
</template>

<script>
export default {
  name: "PersistentMini",
  data: () => ({
    message: "Desafio Jordan!",
    menuVisible: false,
    showNavigation: false,
    showSidepanel: false,
  }),
  methods: {
    toggleMenu() {
      this.menuVisible = !this.menuVisible;
    },
  },
};
</script>

<style lang="scss" scoped>
    .md-app {
    min-height: 350px;
    border: 1px solid rgba(#000, .12);
  }

   // Demo purposes only
  .md-drawer {
    width: 230px;
    max-width: calc(100vw - 125px);
  }
</style>
