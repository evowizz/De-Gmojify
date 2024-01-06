/* Copyright 2024 Dylan Roussel
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

(async () => {
  console.log(
    "%cNo reactions for you!",
    "background: #3C3E4C; color: #D4D5DD; font-size: 24px; padding: 16px; margin: 32px auto; font-weight: bold; border-radius: 16px;",
  );

  function findReactionButtons() {
    return document.querySelectorAll(
      "div.T-I.J-J5-Ji.T-I-Js-IF.R1Zuwf.T-I-ax7.L3",
    );
  }

  const observer = new MutationObserver((mutations, obs) => {
    const buttons = findReactionButtons();

    // Remove all reaction buttons
    buttons.forEach((button) => {
      button.remove();
    });
  });

  observer.observe(document, { childList: true, subtree: true });
})();
