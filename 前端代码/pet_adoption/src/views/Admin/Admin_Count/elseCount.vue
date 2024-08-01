<template>
  <div class="head2">
    <el-container>
      <el-header
        style="
          display: flex;
          height: 100px;
          background-color: #cd8c95;
          border-radius: 15px;
          box-shadow: 2px 2px 2px 2px #bebebe;
        "
      >
        <i
          class="el-icon-document-remove"
          style="
            font-size: 40px;
            height: 40px;
            align-self: center;
            margin-left: 50px;
          "
        >
        </i>
        <h3 style="margin-left: 5px; align-self: center">其他统计</h3>

        <el-drawer title="我是标题" :visible.sync="drawer" :with-header="false">
          <div style="margin: 10px 10px 10px 10px">
            <el-button
              type="primary"
              icon="el-icon-s-opportunity"
              style="color: white"
              >提示</el-button
            >
            <div style="margin-top: 20px">
              <el-button
                type="info"
                icon="el-icon-user-solid"
                circle
                @click="back"
              ></el-button
              ><h style="">：此按钮返回管理员中心</h>
            </div>
            <div style="margin-top: 15px">
              <el-button type="primary" icon="el-icon-thumb" circle></el-button
              ><h style="">：此按钮打开提示</h>
            </div>
            <div style="margin-top: 15px">
              <el-button
                type="primary"
                icon="el-icon-refresh-right"
                circle
              ></el-button
              ><h style="">：此按钮刷新数据</h>
            </div>
          </div>
        </el-drawer>
        <el-button
          type="primary"
          round
          @click="Adminout"
          style="height: 40px; align-self: center; margin-left: 950px"
          >退出</el-button
        >
      </el-header>
      <el-container class="aside" style="margin-top: 10px">
        <el-aside style="display: block; box-shadow: 2px 2px 2px 2px #bebebe">
          <el-menu unique-opened="true">
            <el-submenu index="1">
              <template slot="title">
                <i
                  class="el-icon-user"
                  style="margin-left: 55px; font-size: 25px"
                ></i>
                <span style="font-size: 20px">用户管理</span>
              </template>
              <el-menu-item-group>
                <template slot="title"></template>
                <el-menu-item index="1-1" style="text-align: center"
                  ><router-link to="/InfoUser" style="color: black"
                    >用户信息管理</router-link
                  ></el-menu-item
                >
                <el-menu-item index="1-2" style="text-align: center"
                  ><router-link to="/AppUser" style="color: black"
                    >用户申请管理</router-link
                  >
                </el-menu-item>
                <el-menu-item index="1-3" style="text-align: center"
                  ><router-link to="/ComplaintsUser" style="color: black"
                    >用户投诉管理</router-link
                  ></el-menu-item
                >
              </el-menu-item-group>
            </el-submenu>

            <el-submenu index="2">
              <template slot="title">
                <i
                  class="el-icon-chicken"
                  style="margin-left: 55px; font-size: 25px"
                ></i>
                <span style="font-size: 20px">宠物管理</span>
              </template>
              <el-menu-item-group>
                <template slot="title"></template>
                <el-menu-item index="2-1" style="text-align: center"
                  ><router-link to="/AdminPetInfo" style="color: black"
                    >宠物信息管理</router-link
                  ></el-menu-item
                >
                <el-menu-item index="2-2" style="text-align: center"
                  ><router-link to="/AdminPetApp" style="color: black"
                    >宠物领养情况</router-link
                  ></el-menu-item
                >
                <el-menu-item index="2-3" style="text-align: center"
                  ><router-link to="/PetTag" style="color: black"
                    >宠物标签情况</router-link
                  ></el-menu-item
                >
              </el-menu-item-group>
            </el-submenu>

            <el-submenu index="3">
              <template slot="title">
                <i
                  class="el-icon-bell"
                  style="margin-left: 55px; font-size: 25px"
                ></i>
                <span style="font-size: 20px">通知管理</span>
              </template>
              <el-menu-item-group>
                <template slot="title"></template>
                <el-menu-item index="3-1" style="text-align: center"
                  ><router-link to="/AdminNotification" style="color: black"
                    >用户通知</router-link
                  ></el-menu-item
                >
              </el-menu-item-group>
            </el-submenu>

            <el-submenu index="4">
              <template slot="title">
                <i
                  class="el-icon-document-remove"
                  style="margin-left: 55px; font-size: 25px"
                ></i>
                <span style="font-size: 20px">数据统计</span>
              </template>
              <el-menu-item-group>
                <template slot="title"></template>
                <el-menu-item index="4-1" style="text-align: center"
                  ><router-link to="/petCount" style="color: black"
                    >领养统计</router-link
                  ></el-menu-item
                >
                <el-menu-item index="4-2" style="text-align: center"
                  ><router-link to="/elseCount" style="color: black"
                    >其他统计</router-link
                  ></el-menu-item
                >
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </el-aside>

        <el-main>
          <el-button
            type="info"
            icon="el-icon-user-solid"
            circle
            @click="back"
          ></el-button>
          <el-button
            @click="drawer = true"
            type="primary"
            icon="el-icon-thumb"
            circle
          ></el-button>
          <el-button
            type="primary"
            icon="el-icon-refresh-right"
            circle
          ></el-button>
          <hr style="margin: 10px 0px 10px 0px" />

          <div>
            <el-row :gutter="20">
              <el-col :span="6">
                <div>
                  <el-statistic
                    group-separator=","
                    :precision="2"
                    :value="value2"
                    title="已存在用户数"
                  ></el-statistic>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-statistic title="男女   比">
                    <template slot="formatter"> 521/451 </template>
                  </el-statistic>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-statistic
                    group-separator=","
                    :precision="2"
                    decimal-separator="."
                    :value="value1"
                    title="新增用户数"
                  >
                    <template slot="prefix">
                      <i class="el-icon-s-flag" style="color: red"></i>
                    </template>
                    <template slot="suffix">
                      <i class="el-icon-s-flag" style="color: blue"></i>
                    </template>
                  </el-statistic>
                </div>
              </el-col>
              <el-col :span="6">
                <div>
                  <el-statistic :value="petcount" title="已经收养宠物数">
                    <template slot="suffix">
                      <span @click="like = !like" class="like">
                        <i
                          class="el-icon-star-on"
                          style="color: red"
                          v-show="!!like"
                        ></i>
                        <i class="el-icon-star-off" v-show="!like"></i>
                      </span>
                    </template>
                  </el-statistic>
                </div>
              </el-col>
            </el-row>
          </div>

          <hr style="margin: 10px 0px 10px 0px" />
          <el-progress
            type="circle"
            :percentage="value3"
            style=""
          ></el-progress>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>
  
  <script>
export default {
  data() {
    return {
      drawer: false,
      like: true,
      petcount: 521,
      value1: 4154.564,
      value2: 1314,
      value3: 25,
    };
  },
  methods: {
    back() {
      this.$router.push({ name: "AdminCenter" });
    },
    Adminout() {
      this.$confirm("您要退出账号吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$router.push({ name: "LoginUi" });
          this.$message({
            type: "success",
            message: "退出成功!",
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消操作",
          });
        });
    },
  },
};
</script >
  
  <style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-decoration: none;
}

.like {
  cursor: pointer;
  font-size: 25px;
  display: inline-block;
}
</style>